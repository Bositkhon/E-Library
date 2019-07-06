<?php

use yii\bootstrap\Html;
use yii\bootstrap\ActiveForm;
use common\models\UserProfile;

/* @var $this yii\web\View */
/* @var $model backend\models\UserForm */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $roles yii\rbac\Role[] */
/* @var $permissions yii\rbac\Permission[] */

$this->title = Yii::t('backend', 'Create user');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-create">

    <?php $form = ActiveForm::begin() ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->checkbox(['label' => Yii::t('backend', 'Activate')]) ?>

    <?= $form->field($model, 'roles')->checkboxList($roles) ?>

    <?= $form->field($profile, 'firstname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($profile, 'lastname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($profile, 'middlename')->textInput(['maxlength' => true]) ?>

    <?= $form->field($profile, 'gender')->dropDownlist(
        [
            UserProfile::GENDER_MALE => Yii::t('backend', 'Male'),
            UserProfile::GENDER_FEMALE => Yii::t('backend', 'Female'),
        ],
        ['prompt' => '']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('backend', 'Create'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end() ?>

</div>
