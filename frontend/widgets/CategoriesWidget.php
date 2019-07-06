<?php 

namespace frontend\widgets;

use yii\base\Widget;
use common\models\Category;

class CategoriesWidget extends Widget{

    public function run(){
        $categories = Category::find()->asArray()->all();
        if(!\Yii::$app->getUser()->getIsGuest()){
            return $this->render('categories', [
                'categories' => $categories,
            ]);
        }
    }

}

?>