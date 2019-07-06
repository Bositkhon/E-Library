<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Category;
use vova07\fileapi\Widget as FileAPI;

/* @var $this yii\web\View */
/* @var $model common\models\Book */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="book-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'quantity')->textInput() ?>

    <?= $form->field($model, 'category_id')->dropDownList([
        ArrayHelper::map(Category::find()->all(), 'id', 'title')
    ]) ?>

    <?= $form->field($model, 'author')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'release_year')->textInput() ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cover_img_url')->widget(FileAPI::className(),
        [
            'settings' => [
                'url' => ['/book/fileapi-upload']
            ]
        ]) ?>

    <?= $form->field($model, 'file_url')->widget(FileAPI::className(),
        [
            'settings' => [
                'url' => ['/book/fileapi-upload']
            ]
        ]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('common', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
