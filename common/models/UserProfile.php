<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "user_profile".
 *
 * @property int $user_id
 * @property string $firstname
 * @property string $lastname
 * @property string $middlename
 * @property int $gender
 *
 * @property User $user
 */
class UserProfile extends \yii\db\ActiveRecord
{

    const GENDER_MALE = 1;
    const GENDER_FEMALE = 2;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['firstname', 'lastname', 'gender'], 'required'],
            ['gender', 'in', 'range' => [null, self::GENDER_MALE, self::GENDER_FEMALE]],
            [['firstname', 'lastname', 'middlename'], 'string', 'max' => 255],
            ['firstname', 'match', 'pattern' => '/^[a-zа-яё]+$/iu'],
            ['lastname', 'match', 'pattern' => '/^[a-zа-яё]+(-[a-zа-яё]+)?$/iu'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('common', 'User ID'),
            'firstname' => Yii::t('common', 'Firstname'),
            'lastname' => Yii::t('common', 'Lastname'),
            'middlename' => Yii::t('common', 'Middlename'),
            'gender' => Yii::t('common', 'Gender'),
        ];
    }

    public function getFullname(){
        return $this->firstname . ' ' . $this->lastname . ' ' . $this->middlename;
    }

}
