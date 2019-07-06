<?php 
use yii\bootstrap\Html;
?>
<div class="list-group list-group-custom bg-grey">
    <?php foreach($categories as $category): ?>
    <?php echo Html::a(
        Html::img('@frontendImg/star.svg') . Html::beginTag('span') . $category['title'] . Html::endTag('span'),
        ['/book/category', 'id' => $category['id']],
        ['class' => 'list-group-item list-group-item-custom flex align-items-center']
    );  ?>
    <?php endforeach; ?>
</div>