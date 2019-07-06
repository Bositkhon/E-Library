<?php 

namespace frontend\controllers;

use yii\web\Controller;
use common\models\Book;
use yii\web\NotFoundHttpException;
use common\models\ReserveQuery;
use common\models\FavoriteBook;

class BookController extends Controller{

    public function actionCategory($id){
        $books = Book::find()->where(['category_id' => $id])->all();
        return $this->render('category',[
            'books' => $books
        ]);
    }

    public function actionBook($id){
        $book = Book::findOne(['id' => $id]);
        return $this->renderAjax('book',[
            'book' => $book
        ]);
    }

    public function actionReserve($id){
        $model = new ReserveQuery();
        $model->user_id = \Yii::$app->getUser()->getId();
        $model->book_id = $id;
        if($model->save()){
            \Yii::$app->getSession()->setFlash('success', 'You have successfully sent reservation query for this book!');
        }else{
            throw new NotFoundHttpException("The requested page does not exist");
        }
        return $this->refresh();
    }

    public function actionAddFavorite($id){
        $model = new FavoriteBook();
        $model->user_id = \Yii::$app->getUser()->getId();
        $model->book_id = $id;
        if($model->save()){
            \Yii::$app->getSession()->setFlash('success', 'You have successfully added a book to your favorites list');
        }else{
            throw new NotFoundHttpException("The requested page does not exist");
        }
        return $this->refresh();
    }


}

?>