<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "reserve_query".
 *
 * @property int $id
 * @property int $user_id
 * @property int $book_id
 * @property int $created_at
 * @property int $updated_at
 *
 * @property AcceptedQuery[] $acceptedQueries
 * @property DeclinedQuery[] $declinedQueries
 * @property User $user
 * @property Book $book
 */
class ReserveQuery extends \yii\db\ActiveRecord
{

    const STATUS_NEUTRAL = 0;
    const STATUS_ACCEPTED = 1;
    const STATUS_DECLINED = -1;

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'reserve_query';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'book_id'], 'required'],
            [['user_id', 'book_id', 'created_at', 'updated_at'], 'integer'],
            [['status'], 'in', 'range' => [self::STATUS_ACCEPTED, self::STATUS_DECLINED, self::STATUS_NEUTRAL]],
            [['status'], 'default', 'value' => 0],
            [['user_id', 'book_id'], 'unique', 'targetAttribute' => ['user_id', 'book_id'], 'message' => Yii::t('backend', 'The user has already reservation query for this book')],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['book_id'], 'exist', 'skipOnError' => true, 'targetClass' => Book::className(), 'targetAttribute' => ['book_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'user_id' => Yii::t('common', 'User ID'),
            'book_id' => Yii::t('common', 'Book ID'),
            'created_at' => Yii::t('common', 'Created At'),
            'updated_at' => Yii::t('common', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAcceptedQueries()
    {
        return $this->hasMany(AcceptedQuery::className(), ['query_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDeclinedQueries()
    {
        return $this->hasMany(DeclinedQuery::className(), ['query_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'book_id']);
    }

    public function getReservationInfO(){
        return $this->user->userProfile->getFullname() . ' - ' . $this->book->title;
    }

    public function getAcceptedQueryRowOptions(){
        $options = [
            'class' => 'bg-info'
        ];
        if($this->status == self::STATUS_NEUTRAL){
            return $options;
        }else if($this->status == self::STATUS_ACCEPTED){
            $options['class'] = 'bg-success';
            return  $options;
        }else if($this->status == self::STATUS_DECLINED){
            $options['class'] = 'bg-danger';
            return $options;
        }
    }

}
