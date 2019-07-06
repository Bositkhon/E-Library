<?php 
use yii\bootstrap\Html;
use yii\helpers\Url;

?>
<div class="row">
    <?php if($books): ?>
        <?php foreach ($books as $book): ?>
            <div class="col-sm-6 col-md-3">
                <a href="#" class="open-book-info-btn" data-url="<?php echo Url::to(['/book/book', 'id' => $book->id]); ?>">
                    <div class="thumbnail text-center">
                        <div class="thumbnail-image">
                            <?php echo Html::img('@frontendImg/img1.jpg',[
                                'class' => 'img-responsive center-block'
                            ]); ?>
                        </div>
                        <div class="caption-custom">
                            <h6><?php echo $book->title ?></h6>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    <?php else: ?>
        <h3>There are no books yet in this category</h3>
    <?php endif; ?>
</div>

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