<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "accepted_query".
 *
 * @property int $id
 * @property int $query_id
 * @property string $issue_date
 * @property string $deadline_date
 * @property int $created_at
 * @property int $updated_at
 *
 * @property ReserveQuery $query
 */
class AcceptedQuery extends \yii\db\ActiveRecord
{

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
        return 'accepted_query';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['query_id', 'issue_date', 'deadline_date'], 'required'],
            [['query_id', 'created_at', 'updated_at'], 'integer'],
            [['issue_date', 'deadline_date'], 'safe'],
            [['query_id'], 'exist', 'skipOnError' => true, 'targetClass' => ReserveQuery::className(), 'targetAttribute' => ['query_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'query_id' => Yii::t('common', 'Query ID'),
            'issue_date' => Yii::t('common', 'Issue Date'),
            'deadline_date' => Yii::t('common', 'Deadline Date'),
            'created_at' => Yii::t('common', 'Created At'),
            'updated_at' => Yii::t('common', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuery()
    {
        return $this->hasOne(ReserveQuery::className(), ['id' => 'query_id']);
    }
}
