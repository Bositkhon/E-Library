<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\ReserveQuery;

/* @var $this yii\web\View */
/* @var $model common\models\DeclinedQuery */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="declined-query-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'query_id')->dropDownList([
        ArrayHelper::map(ReserveQuery::find()->all(), 'id', 'reservationInfo')
    ]) ?>

    <?= $form->field($model, 'reason')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('common', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
