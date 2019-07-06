<?php 

use yii\bootstrap\Html;

?>
<header>
    <nav class="navbar navbar-custom bg-blue">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand flex justify-content-center align-items-center" href="/">
                    <?php echo Html::img('@frontendImg/library.svg', [
                        'width' => '40px',
                        'height' => '40px'
                    ]) ?>
                </a>
                <a class="navbar-brand flex justify-content-center align-items-center" href="#" onclick="changeTheme()">
                    <?php echo Html::img('@frontendImg/mode-white.svg', [
                        'width' => '40px',
                        'height' => '40px'
                    ]) ?>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <?php echo Html::a('Profile', ['/profile/index']) ?>
                    </li>
                    <?php if(!Yii::$app->getUser()->getIsGuest()): ?>
                        <li><a href="user.php">Logout</a></li>
                    <?php endif; ?>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>