<?php 
use yii\bootstrap\Html;
use yii\helpers\HtmlPurifier;

?>
<div class="row">
    <div class="col-sm-6">
        <?php echo Html::img('@storageUrl/books/covers/'.$book->cover_img_url, [
            'class' => 'img-responsive center-block',
            'width' => '200px',
        ]); ?>
        <div class="btn-group btn-group-justified">
            <?php echo Html::a(
                    '<span class="glyphicon glyphicon-download" aria-hidden="true"></span> Reserve',
                    ['/book/reserve', 'id' => $book->id],
                    [
                        'class' => 'btn btn-success',
                    ]
                ); ?>
        </div>
        <br>
        <div class="btn-group btn-group-justified">
            <?php 
            if(!Yii::$app->getUser()->getIdentity()->hasFavoriteBook($book->id)){
                echo Html::a(
                    '<span class="glyphicon glyphicon-download" aria-hidden="true"></span> Add to favorites',
                    ['/book/add-favorite', 'id' => $book->id],
                    [
                        'class' => 'btn btn-primary',
                    ]
                );
            }?>
            <?php echo Html::a(
                '<span class="glyphicon glyphicon-download" aria-hidden="true"></span> Download',
                '@storageUrl/books/' . $book->file_url,
                [
                    'class' => 'btn btn-primary',
                ]
            ); ?>
        </div>
        <!-- <div class="btn-group btn-group-justified">
            <a href="#" class="btn btn-danger">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                Remove
            </a>
        </div> -->
    </div>
    <div class="col-sm-6">
        <h1><?php echo Html::encode($book->title) ?></h1>
        <p>
            <strong>Author:</strong>
            <?php echo $book->author; ?>
        </p>
        <p>
            <strong>Release year:</strong>
            <?php echo $book->release_year; ?>
        </p>
        <p>
            <?php echo HtmlPurifier::process($book->description) ?>
        </p>
    </div>
</div>