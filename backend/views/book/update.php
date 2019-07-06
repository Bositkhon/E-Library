<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Book */

$this->title = Yii::t('common', 'Update Book: {name}', [
    'name' => $model->title,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('common', 'Update');
?>
<div class="book-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
