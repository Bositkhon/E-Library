<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Book */

$this->title = Yii::t('common', 'Create Book');
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
