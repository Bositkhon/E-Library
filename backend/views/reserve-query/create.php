<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ReserveQuery */

$this->title = Yii::t('common', 'Create Reserve Query');
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Reserve Queries'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reserve-query-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
