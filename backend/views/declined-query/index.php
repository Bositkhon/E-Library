<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\ReserveQuery;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\DeclinedQuerySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('common', 'Declined Queries');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="declined-query-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'query_id',
                'value' => 'query.reservationInfo',
                'filter' => ArrayHelper::map(ReserveQuery::find()->all(), 'id', 'reservationInfo'),
            ],
            'reason',
            'created_at:datetime',
            'updated_at:datetime',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
