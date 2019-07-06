<?php 
use yii\bootstrap\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

?>
<div class="form-login-block bg-blue text-white">
    <div class="title-login-block row">
        <div class="col-xs-4 p-10">
            <?php echo Html::img('@frontendImg/avatar-white.svg',[
                    'class' => 'img-responsive',
                ]); ?>
        </div>
        <div class="col-xs-8">
            <h1>Login</h1>
        </div>
    </div>
    <?php $form = ActiveForm::begin([
        'action' => Url::to(['/account/sign-in/login']),
        'options' => [
            'class' => 'form-horizontal form-login text-center'
        ]
    ]); ?>
        <?php echo $form->field($model, 'identity',[
            'template' => '<div class="form-group"><div class="col-sm-12">{input}</div></div>',
            'options' => []
        ])->textInput([
            'placeholder' => 'Username'
        ])->label(false) ?>

        <?php echo $form->field($model, 'password',[
            'template' => '<div class="form-group"><div class="col-sm-12">{input}</div></div>',
            'options' => [
                'class' => 'form-control',
                'tag' => false
            ]
        ])->passwordInput([
            'placeholder' => 'Password'
        ])->label(false) ?>
        <div class="form-group">
            <div class="col-sm-12">
                <button type="submit" class="btn btn-custom">Sign in</button>
            </div>
        </div>
        <?php ActiveForm::end(); ?>
</div>