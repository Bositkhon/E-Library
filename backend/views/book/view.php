<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Book */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('common', 'Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="book-view">

    <p>
        <?= Html::a(Yii::t('common', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('common', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('common', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'quantity',
            'category.title',
            'author',
            'release_year',
            'description:ntext',
            [
                'attribute' => 'cover_img_url',
                'format' => 'html',
                'filter' => false,
                'value' => function ($model, $value){
                    return Html::img($model->getCoverImageURL(),[
                        'width' => '400px'
                    ]);
                }
            ],
            [
                'attribute' => 'file_url',
                'format' => 'html',
                'filter' => false,
                'value' => function ($model, $value){
                    return Html::a($model->file_url, $model->getFileURL());
                }
            ],
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>

</div>
