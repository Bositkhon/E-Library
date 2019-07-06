<?php 

namespace frontend\controllers;

use yii\web\Controller;
use common\models\FavoriteBook;

class ProfileController extends Controller{

    public function actionIndex(){

        return $this->render('index');
    }

}

?>