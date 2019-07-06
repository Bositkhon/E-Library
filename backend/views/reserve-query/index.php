<?php

use yii\helpers\Url;
use yii\grid\GridView;
use common\models\Book;
use common\models\User;
use yii\bootstrap\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Modal;
use common\models\ReserveQuery;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\ReserveQuerySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('common', 'Reserve Queries');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reserve-query-index">

    <p>
        <?= Html::a(Yii::t('common', 'Create Reserve Query'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'tableOptions' => [
            'class' => 'table table-responsive',
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'rowOptions' => function ($model, $key, $index, $grid){
            return $model->getAcceptedQueryRowOptions();
        },

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
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

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {accept} {decline} {update} {delete}',
                'buttons' => [
                    'accept' => function ($url, $model, $key){
                        if($model->status == ReserveQuery::STATUS_NEUTRAL){
                            return Html::a('<i class="fa fa-check" aria-hidden="true"></i>', '#',[
                                'id' => 'accept-query-btn',
                                'data' => [
                                    'url' => Url::to(['/accepted-query/create']),
                                    'id' => $model->id,
                                ]
                            ]);
                        }
                    },
                    'decline' => function ($url, $model, $key){
                        if($model->status == ReserveQuery::STATUS_NEUTRAL){
                            return Html::a('<i class="fa fa-remove" aria-hidden="true"></i>', '#',[
                                'id' => 'decline-query-btn',
                                'data' => [
                                    'url' => Url::to(['/declined-query/create']),
                                    'id' => $model->id,
                                ]
                            ]);
                        }
                    },
                ]
            ],
        ],
    ]); ?>


</div>

<?php 
Modal::begin([
    'header' => '<h4>Accept query</h4>',
    'id' => 'accept-query-modal',
    'size' => 'modal-md',
]);
Modal::end();
Modal::begin([
    'header' => '<h4>Accept query</h4>',
    'id' => 'decline-query-modal',
    'size' => 'modal-md',
]);
Modal::end();
?>

<?php 

$js = <<<JS
    $('#accept-query-btn').on('click', function(){
        let modal = $('#accept-query-modal');
        modal.modal();
        modal.find('.modal-body').load($(this).data('url'));
        // console.log(modal.find('input'));
        // modal.find('#acceptedquery-query_id').val($(this).data('id'));
    });

    $('#accept-query-modal').on('shown.bs.modal', function (event) {
        var modal = $(this);
        modal.find('.modal-body input#acceptedquery-query_id').val($('#accept-query-btn').data('id'));
    })
    
JS;

$this->registerJs($js);

$js = <<<JS
    $('#decline-query-btn').on('click', function(){
        let modal = $('#decline-query-modal');
        modal.modal();
        modal.find('.modal-body').load($(this).data('url'));
    });

    $('#decline-query-modal').on('shown.bs.modal', function (event) {
        var modal = $(this);
        modal.find('.modal-body input#declinedquery-query_id').val($('#decline-query-btn').data('id'));
    })
    
JS;

$this->registerJs($js);

?>