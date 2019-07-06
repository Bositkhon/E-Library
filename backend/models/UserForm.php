<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\helpers\ArrayHelper;
use common\models\User;

/**
 * Create user form.
 */
class UserForm extends Model
{
    public $username;
    public $password;
    public $status;
    public $roles;

    private $model;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'match', 'pattern' => '#^[\w_-]+$#i'],
            ['username', 'unique',
                'targetClass' => User::class,
                'filter' => function ($query) {
                    if (!$this->getModel()->isNewRecord) {
                        $query->andWhere(['not', ['id' => $this->getModel()->id]]);
                    }
                }
            ],
            ['username', 'string', 'min' => 2, 'max' => 32],

            ['password', 'required', 'on' => 'create'],
            ['password', 'string', 'min' => 6, 'max' => 32],

            ['status', 'integer'],
            ['status', 'in', 'range' => array_keys(User::statuses())],
            ['roles', 'each',
                'rule' => ['in', 'range' => ArrayHelper::getColumn(Yii::$app->authManager->getRoles(), 'name')],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'username' => Yii::t('backend', 'Username'),
            'password' => Yii::t('backend', 'Password'),
            'status' => Yii::t('backend', 'Status'),
            'roles' => Yii::t('backend', 'Roles'),
        ];
    }

    /**
     * @inheritdoc
     * @return User
     */
    public function setModel($model)
    {
        $this->username = $model->username;
        $this->status = $model->status;
        $this->model = $model;
        $this->roles = ArrayHelper::getColumn(Yii::$app->authManager->getRolesByUser($model->getId()), 'name');

        return $this->model;
    }

    /**
     * @inheritdoc
     */
    public function getModel()
    {
        if (!$this->model) {
            $this->model = new User();
        }

        return $this->model;
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function save(array $profile_data = [])
    {
        if ($this->validate()) {
            $model = $this->getModel();
            $isNewRecord = $model->getIsNewRecord();
            $model->username = $this->username;
            $model->status = $this->status;
            if ($this->password) {
                $model->setPassword($this->password);
            }
            $model->generateAuthKey();
            if ($model->save() && $isNewRecord) {
                $model->afterSignup($profile_data);
            }
            $auth = Yii::$app->authManager;
            $auth->revokeAll($model->getId());

            if ($this->roles && is_array($this->roles)) {
                foreach ($this->roles as $role) {
                    $auth->assign($auth->getRole($role), $model->getId());
                }
            }

            return !$model->hasErrors();
        }

        return;
    }
}
