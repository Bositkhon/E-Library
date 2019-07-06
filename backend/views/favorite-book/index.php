<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\User;
use common\models\Book;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\FavoriteBookSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('common', 'Favorite Books');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="favorite-book-index">

    <p>
        <?= Html::a(Yii::t('common', 'Create Favorite Book'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'user_id',
                'value' => 'user.userProfile.fullname',
                'filter' => ArrayHelper::map(User::find()->all(), 'id','username'),
            ],
            [
                'attribute' => 'book_id',
                'value' => 'book.title',
                'filter' => ArrayHelper::map(Book::find()->all(), 'id', 'title'),
            ],
            'created_at:datetime',
            'updated_at:datetime',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
