<?php 

namespace frontend\widgets;

use yii\base\Widget;
use common\models\LoginForm;
use common\models\Category;

class LoginWidget extends Widget{

    public function run()
    {
        $model = new LoginForm();
        if(\Yii::$app->getUser()->getIsGuest()){
            return $this->render('form',[
                'model' => $model,
            ]);
        }else{
            $categories = Category::find()->asArray()->all();
            return $this->render('user_info',[
                'categories' => $categories
            ]);
        }
    }

}

?>