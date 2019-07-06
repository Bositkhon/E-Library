<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ReserveQuery */

$this->title = Yii::t('common', 'Update Reserve Query: {name}', [
    'name' => $model->id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Reserve Queries'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('common', 'Update');
?>
<div class="reserve-query-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
