<?php

use common\models\User;
use yii\bootstrap\Html;
use yii\bootstrap\ActiveForm;
use common\models\UserProfile;

/* @var $this yii\web\View */
/* @var $user backend\models\UserForm */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $roles yii\rbac\Role[] */
/* @var $permissions yii\rbac\Permission[] */

$this->title = Yii::t('backend', 'Update user: {username}', ['username' => $user->username]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="user-update">

    <?php $form = ActiveForm::begin() ?>

    <?= $form->field($user, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($user, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($user, 'status')->label(Yii::t('backend', 'Status'))->radioList(User::statuses()) ?>

    <?= $form->field($user, 'roles')->checkboxList($roles) ?>

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
        <?= Html::submitButton(Yii::t('backend', 'Update'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end() ?>

</div>
