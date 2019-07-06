<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
use common\models\Category;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\BookSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('common', 'Books');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-index">

    <p>
        <?= Html::a(Yii::t('common', 'Create Book'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            'title',
            'quantity',
            [
                'attribute' => 'category_id',
                'filter' => ArrayHelper::map(Category::find()->all(), 'id', 'title'),
                'value' => function ($model, $key, $index, $column){
                    return $model->category->title;
                }
            ],
            'author',
            'release_year',
            'description:ntext',
            [
                'attribute' => 'cover_img_url',
                'format' => 'html',
                'filter' => false,
                'value' => function ($model, $key, $index, $column){
                    return Html::img($model->getCoverImageURL(),[
                        'width' => '70px'
                    ]);
                }
            ],
            [
                'attribute' => 'file_url',
                'format' => 'html',
                'filter' => false,
                'value' => function ($model, $key, $index, $column){
                    return Html::a($model->file_url, $model->getFileURL());

                }
            ],
            'created_at:datetime',
            //'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
