<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AcceptedQuery */

$this->title = Yii::t('common', 'Create Accepted Query');
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Accepted Queries'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accepted-query-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
