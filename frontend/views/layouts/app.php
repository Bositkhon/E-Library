<?php 
use yii\web\View;
use yii\bootstrap\Html;
use frontend\assets\CustomAsset;
use frontend\widgets\LoginWidget;
use lo\modules\noty\Wrapper;
use yii\bootstrap\Modal;

/**
 * @var View $this
 */

CustomAsset::register($this);

?>
<?php echo $this->beginPage(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags(); ?>
    <title><?php echo Html::encode($this->title) ?></title>
    <?php $this->head(); ?>
</head>

<?php $this->beginBody(); ?>

<body id="body">
    <?php echo $this->render('partials/header') ?>
    <main>
        <!-- MAIN CONTAINER -->
        <div class="container">
            <?php echo Wrapper::widget(); ?>
            <div class="row">
                <!-- LEFT BLOCK WITH LOGIN FORM -->
                <div class="col-md-3 sidebar">
                    <?php echo LoginWidget::widget(); ?>
                </div>
                <!-- LEFT BLOCK WITH LOGIN FORM END -->

                <!-- CONTENT -->
                <div class="col-md-9 content">
                    <?php echo $content; ?>
                </div>
                <!-- CONTENT END -->
            </div>
        </div>
        <!-- MAIN CONTAINER END -->
        <br>
    </main>

    <!-- Modal -->

    <?php 
    
    Modal::begin([
        'id' => 'book-info-modal',
        'header' => '<h4>Book info</h4>',
        'size' => 'modal-lg'
    ]);
    Modal::end();
    ?>

    <?//php echo $this->render('partials/modal') ?>

    <?php $this->endBody(); ?>
</body>

</html>
<?php $this->endPage(); ?>