<?php 
use yii\bootstrap\Html;
?>
<div class="row">
    <div class="col-xs-12">
        <div class="user-block bg-blue p-10 text-white">
            <div class="row">
                <div class="col-xs-4 p-10 flex column align-items-center">
                    <?php echo Html::img('@frontendImg/avatar-white.svg',[
                        'class' => 'img-responsive',
                    ]); ?>
                    <?php echo Html::a('Log out', ['/account/sign-in/logout'],[
                        'class' => 'btn btn-custom',
                        'data-method' => 'post',
                    ]) ?>
                </div>
                <div class="col-xs-6">
                    <h4><?php echo Html::encode(Yii::$app->getUser()->getIdentity()->username) ?></h4>
                    <h5><?php echo Html::encode(Yii::$app->getUser()->getIdentity()->userProfile->firstname) ?></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12">
        <?php if($categories): ?>
            <div class="list-group list-group-custom bg-gray">
                <?php foreach ($categories as $category){
                    echo Html::a(
                        Html::img('@frontendImg/english.svg') . Html::beginTag('span') . $category['title'] . Html::endTag('span') ,
                        ['/book/category', 'id' => $category['id']],
                        [
                            'class' => 'list-group-item list-group-item-custom flex align-items-center',
                        ]
                    );
                } ?>
            </div>
        <?php endif; ?>
    </div>
</div>