<?php 
use yii\helpers\Url;
use yii\bootstrap\Html;
?>

<div class="page-header">
    <h3>
        Favorite books
    </h3>
</div>
<?php 
$favorites = Yii::$app->getUser()->getIdentity()->favoriteBooks;
$reserved = Yii::$app->getUser()->getIdentity()->reserveQueries;
?>

<?php if($favorites): ?>
<div class="row">
    <?php foreach ($favorites as $favorite): ?>
        <div class="col-sm-6 col-md-3">
            <a href="#" class="open-book-info-btn"
                data-url="<?php echo Url::to(['/book/book', 'id' => $favorite->book->id]); ?>">
                <div class="thumbnail text-center">
                    <div class="thumbnail-image">
                        <?php echo Html::img('@storageUrl/books/covers/'.$favorite->book->cover_img_url,[
                                        'class' => 'img-responsive center-block'
                                    ]); ?>
                    </div>
                    <div class="caption-custom">
                        <h6><?php echo $favorite->book->title ?></h6>
                    </div>
                </div>
            </a>
        </div>
    <?php endforeach; ?>
</div>
<?php else: ?>
    <h3>There are no books yet in this category</h3>
<?php endif; ?>

<div class="page-header">
    <h3>
        Reserved queries
    </h3>
</div>

<?php if($reserved): ?>
<div class="row">
    <?php foreach ($reserved as $reserve): ?>
        <div class="col-sm-6 col-md-3">
            <a href="#" class="open-book-info-btn"
                data-url="<?php echo Url::to(['/book/book', 'id' => $reserve->book->id]); ?>">
                <div class="thumbnail text-center">
                    <div class="thumbnail-image">
                        <?php echo Html::img('@storageUrl/books/covers/'.$reserve->book->cover_img_url,[
                                        'class' => 'img-responsive center-block'
                                    ]); ?>
                    </div>
                    <div class="caption-custom">
                        <h6><?php echo $reserve->book->title ?></h6>
                    </div>
                </div>
            </a>
        </div>
    <?php endforeach; ?>
</div>
<?php else: ?>
    <h3>There are no books yet in this category</h3>
<?php endif; ?>

<?php 
$js = <<<JS
    $('.open-book-info-btn').on('click', function(){
        let modal = $('#book-info-modal');
        modal.find('.modal-body').load($(this).data('url'));
        modal.modal('toggle', $(this));
    });
JS;

$this->registerJs($js);

?>