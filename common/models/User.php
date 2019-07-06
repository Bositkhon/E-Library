<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use common\models\ReserveQuery;
use common\models\query\UserQuery;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $auth_key
 * @property string $access_token
 * @property string $password_hash
 * @property integer $status
 * @property string $ip
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $action_at
 *
 */
class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_BANNED = 2;
    const STATUS_DELETED = 3;

    const ROLE_USER = 'user';
    const ROLE_MANAGER = 'manager';
    const ROLE_ADMINISTRATOR = 'administrator';

    const EVENT_AFTER_SIGNUP = 'afterSignup';

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::class,
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username'], 'unique'],
            ['username', 'filter', 'filter' => '\yii\helpers\Html::encode'],
            ['status', 'default', 'value' => self::STATUS_INACTIVE],
            ['status', 'in', 'range' => array_keys(self::statuses())],
            ['ip', 'ip'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'username' => Yii::t('common', 'Username'),
            'status' => Yii::t('common', 'Status'),
            'created_at' => Yii::t('common', 'Created at'),
            'updated_at' => Yii::t('common', 'Updated at'),
            'action_at' => Yii::t('common', 'Last action at'),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['access_token' => $token, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by username.
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password.
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model.
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key.
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new access token.
     */
    public function generateAccessToken()
    {
        $this->access_token = Yii::$app->security->generateRandomString();
    }

    /**
     * Removes access token.
     */
    public function removeAccessToken()
    {
        $this->access_token = null;
    }

    /**
     * Returns user statuses list
     *
     * @param mixed $status
     * @return array|mixed
     */
    public static function statuses($status = null)
    {
        $statuses = [
            self::STATUS_INACTIVE => Yii::t('common', 'Inactive'),
            self::STATUS_ACTIVE => Yii::t('common', 'Active'),
            self::STATUS_BANNED => Yii::t('common', 'Banned'),
            self::STATUS_DELETED => Yii::t('common', 'Deleted'),
        ];

        if ($status === null) {
            return $statuses;
        }

        return $statuses[$status];
    }

    /**
     * Creates user profile and application event.
     *
     * @param array $profileData
     */
    public function afterSignup(array $profile_data = [])
    {
        $profile = new UserProfile();
        $profile->load($profile_data);
        $this->link('userProfile', $profile);
        $profile->save();
        
        $auth = Yii::$app->authManager;
        $auth->assign($auth->getRole(self::ROLE_USER), $this->getId());
    }

    /**
     * @inheritdoc
     * @return \common\models\query\UserQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserQuery(get_called_class());
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserProfile()
    {
        return $this->hasOne(UserProfile::class, ['user_id' => 'id']);
    }

    public function getFavoriteBooks(){
        return $this->hasMany(FavoriteBook::className(), ['user_id' => 'id']);
    }

    public function getReserveQueries(){
        return $this->hasMany(ReserveQuery::className(), ['user_id' => 'id']);
    }

    public function hasFavoriteBook($book_id){
        $books = $this->hasMany(FavoriteBook::className(), ['user_id' => 'id'])
        ->andWhere(['book_id' => $book_id])->all();
        $has = false;
        if(empty($books)){
            return $has;
        }else{
            foreach ($books as $book){
                if ($book->id == $book_id){
                    $has = true;
                }
            }
        }
        return $has;
    }

}
