<?php

namespace backend\controllers;

use Yii;
use common\models\AcceptedQuery;
use backend\models\search\AcceptedQuerySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\ReserveQuery;
use common\models\Book;

/**
 * AcceptedQueryController implements the CRUD actions for AcceptedQuery model.
 */
class AcceptedQueryController extends Controller
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
     * Lists all AcceptedQuery models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new AcceptedQuerySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single AcceptedQuery model.
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
     * Creates a new AcceptedQuery model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new AcceptedQuery();

        if ($model->load(Yii::$app->request->post())) {
            $query = ReserveQuery::findOne(['id' => $model->query_id]);
            
            if($query->book->quantity > 0){
                $book = Book::findOne(['id' => $query->book_id]);
                $book->quantity = $book->quantity - 1;
                $book->save();
                $query->status = ReserveQuery::STATUS_ACCEPTED;
                $query->save();
                $model->save();
                Yii::$app->getSession()->setFlash('success', 'Book has been accepted');
                return $this->redirect(['index']);
            }else{
                Yii::$app->getSession()->setFlash('error', 'The book is out of stock');
                return $this->redirect(['index']);
            }
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing AcceptedQuery model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing AcceptedQuery model.
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

        $book = Book::findOne(['id' => $query->book_id]);
        $book->quantity = $book->quantity + 1;
        $book->save();

        $model->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the AcceptedQuery model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return AcceptedQuery the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = AcceptedQuery::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('common', 'The requested page does not exist.'));
    }
}
