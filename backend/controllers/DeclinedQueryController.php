<?php

namespace backend\controllers;

use Yii;
use common\models\DeclinedQuery;
use backend\models\search\DeclinedQuerySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\ReserveQuery;

/**
 * DeclinedQueryController implements the CRUD actions for DeclinedQuery model.
 */
class DeclinedQueryController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all DeclinedQuery models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DeclinedQuerySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DeclinedQuery model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new DeclinedQuery model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new DeclinedQuery();

        if ($model->load(Yii::$app->request->post())) {
            $query = ReserveQuery::findOne(['id' => $model->query_id]);
            $query->status = ReserveQuery::STATUS_DECLINED;
            $query->save();
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing DeclinedQuery model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing DeclinedQuery model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $query = ReserveQuery::findOne(['id' => $model->query_id]);
        $query->status = ReserveQuery::STATUS_NEUTRAL;
        $query->save();
        $model->delete();
        return $this->redirect(['index']);
    }

    /**
     * Finds the DeclinedQuery model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return DeclinedQuery the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = DeclinedQuery::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('common', 'The requested page does not exist.'));
    }
}
