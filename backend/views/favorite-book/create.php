<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\FavoriteBook */

$this->title = Yii::t('common', 'Create Favorite Book');
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Favorite Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="favorite-book-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
