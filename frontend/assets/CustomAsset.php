<?php 

namespace frontend\assets;

use yii\web\AssetBundle;

class CustomAsset extends AssetBundle{

    public $basePath = '@webroot/main';
    public $baseUrl = '@web/main';

    public $css = [
        'fonts/Quicksand.css',
        'css/styles.css',
        'css/dark.css',
    ];

    public $js = [
        'js/script.js',
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapPluginAsset',
        'yii\bootstrap\BootstrapAsset',
    ];

}

?>