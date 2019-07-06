<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AcceptedQuery */

$this->title = Yii::t('common', 'Update Accepted Query: {name}', [
    'name' => $model->id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Accepted Queries'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('common', 'Update');
?>
<div class="accepted-query-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
