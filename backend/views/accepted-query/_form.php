<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\ReserveQuery;
use bs\Flatpickr\FlatpickrWidget;

/* @var $this yii\web\View */
/* @var $model common\models\AcceptedQuery */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="accepted-query-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'query_id')->dropDownList([
        ArrayHelper::map(ReserveQuery::find()->all(), 'id', 'reservationInfo')
    ]) ?>

    <?= $form->field($model, 'issue_date')->widget(FlatpickrWidget::className(),[
        'locale' => strtolower(substr(Yii::$app->language, 0, 2)),
        'groupBtnShow' => true,
        'options' => [
            'class' => 'form-control',
        ],
        'clientOptions' => [
            'allowInput' => true,
        ],
    ]) ?>

    <?= $form->field($model, 'deadline_date')->widget(FlatpickrWidget::className(),[
        'locale' => strtolower(substr(Yii::$app->language, 0, 2)),
        'groupBtnShow' => true,
        'options' => [
            'class' => 'form-control',
        ],
        'clientOptions' => [
            'allowInput' => true,
        ],
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('common', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
