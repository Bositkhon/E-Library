<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\FavoriteBook */

$this->title = Yii::t('common', 'Update Favorite Book: {name}', [
    'name' => $model->id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Favorite Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('common', 'Update');
?>
<div class="favorite-book-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
