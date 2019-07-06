<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\User;
use common\models\Book;

/* @var $this yii\web\View */
/* @var $model common\models\FavoriteBook */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="favorite-book-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_id')->dropDownList([
        ArrayHelper::map(User::find()->all(), 'id', 'username')
    ]) ?>

    <?= $form->field($model, 'book_id')->dropDownList([
        ArrayHelper::map(Book::find()->all(), 'id', 'title'),
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('common', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
