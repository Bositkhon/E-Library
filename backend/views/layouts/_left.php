<?php

use backend\models\Log;
use backend\widgets\Menu;
use common\models\ReserveQuery;
use common\models\AcceptedQuery;
use common\models\DeclinedQuery;

/* @var $this \yii\web\View */
?>
<aside class="main-sidebar">
    <section class="sidebar">
        <?= Menu::widget([
            'options' => ['class' => 'sidebar-menu'],
            'items' => [
                [
                    'label' => Yii::t('backend', 'Main'),
                    'options' => ['class' => 'header'],
                ],
                [
                    'label' => Yii::t('backend', 'Main menu'),
                    'url' => ['/site/index'],
                    'icon' => '<i class="fa fa-sitemap"></i>',
                ],
                [
                    'label' => Yii::t('backend', 'App settings'),
                    'url' => ['/site/settings'],
                    'icon' => '<i class="fa fa-cog" aria-hidden="true"></i>',
                ],
                [
                    'label' => Yii::t('backend', 'Books'),
                    'url' => ['/book/index'],
                    'icon' => '<i class="fa fa-bookmark" aria-hidden="true"></i>',
                ],
                [
                    'label' => Yii::t('backend', 'Categories'),
                    'url' => ['/category/index'],
                    'icon' => '<i class="fa fa-folder-open" aria-hidden="true"></i>',
                ],
                [
                    'label' => Yii::t('backend', 'Book reserve queries'),
                    'url' => ['/reserve-query/index'],
                    'icon' => '<i class="fa fa-bell" aria-hidden="true"></i>',
                    'badge' => ReserveQuery::find()->count(),
                    'badgeOptions' => ['class' => 'label-warning'],
                ],
                [
                    'label' => Yii::t('backend', 'Accepted queries'),
                    'url' => ['/accepted-query/index'],
                    'icon' => '<i class="fa fa-bell" aria-hidden="true"></i>',
                    'badge' => AcceptedQuery::find()->count(),
                    'badgeOptions' => ['class' => 'label-success'],
                ],
                [
                    'label' => Yii::t('backend', 'Declined queries'),
                    'url' => ['/declined-query/index'],
                    'icon' => '<i class="fa fa-bell" aria-hidden="true"></i>',
                    'badge' => DeclinedQuery::find()->count(),
                    'badgeOptions' => ['class' => 'label-danger'],
                ],
                [
                    'label' => Yii::t('backend', 'User favorite books'),
                    'url' => ['/favorite-book/index'],
                    'icon' => '<i class="fa fa-star-half-o" aria-hidden="true"></i>',
                ],
                [
                    'label' => Yii::t('backend', 'System'),
                    'options' => ['class' => 'header'],
                ],
                [
                    'label' => Yii::t('backend', 'Users'),
                    'url' => ['/user/index'],
                    'icon' => '<i class="fa fa-users"></i>',
                    'visible' => Yii::$app->user->can('administrator'),
                ],
                [
                    'label' => Yii::t('backend', 'Other'),
                    'url' => '#',
                    'icon' => '<i class="fa fa-terminal"></i>',
                    'options' => ['class' => 'treeview'],
                    'items' => [
                        [
                            'label' => 'Gii',
                            'url' => ['/gii'],
                            'icon' => '<i class="fa fa-angle-double-right"></i>',
                            'visible' => YII_ENV_DEV,
                        ],
                        ['label' => Yii::t('backend', 'File manager'), 'url' => ['/file-manager/index'], 'icon' => '<i class="fa fa-angle-double-right"></i>'],
                        [
                            'label' => Yii::t('backend', 'DB manager'),
                            'url' => ['/db-manager/default/index'],
                            'icon' => '<i class="fa fa-angle-double-right"></i>',
                            'visible' => Yii::$app->user->can('administrator'),
                        ],
                        [
                            'label' => Yii::t('backend', 'System information'),
                            'url' => ['/phpsysinfo/default/index'],
                            'icon' => '<i class="fa fa-angle-double-right"></i>',
                            'visible' => Yii::$app->user->can('administrator'),
                        ],
                        ['label' => Yii::t('backend', 'Key storage'), 'url' => ['/key-storage/index'], 'icon' => '<i class="fa fa-angle-double-right"></i>'],
                        ['label' => Yii::t('backend', 'Cache'), 'url' => ['/service/cache'], 'icon' => '<i class="fa fa-angle-double-right"></i>'],
                        ['label' => Yii::t('backend', 'Clear assets'), 'url' => ['/service/clear-assets'], 'icon' => '<i class="fa fa-angle-double-right"></i>'],
                        [
                            'label' => Yii::t('backend', 'Logs'),
                            'url' => ['/log/index'],
                            'icon' => '<i class="fa fa-angle-double-right"></i>',
                            'badge' => Log::find()->count(),
                            'badgeOptions' => ['class' => 'label-danger'],
                        ],
                    ],
                ],
            ],
        ]) ?>
    </section>
</aside>
