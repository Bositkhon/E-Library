<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use vova07\fileapi\behaviors\UploadBehavior;

/**
 * This is the model class for table "book".
 *
 * @property int $id
 * @property string $title
 * @property int $quantity
 * @property int $category_id
 * @property string $author
 * @property int $release_year
 * @property string $description
 * @property string $cover_img_url
 * @property string $file_url
 * @property int $created_at
 * @property int $updated_at
 *
 * @property Category $category
 * @property FavoriteBook[] $favoriteBooks
 * @property ReserveQuery[] $reserveQueries
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'book';
    }

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
            ],
            [
                'class' => UploadBehavior::className(),
                'attributes' => [
                    'cover_img_url' => [
                        'path' => '@storage/books/covers',
                        'tempPath' => '@storage/temp',
                        'url' => '@storageUrl/books/covers'
                    ],
                    'file_url' => [
                        'path' => '@storage/books/',
                        'tempPath' => '@storage/temp',
                        'url' => '@storageUrl/books'
                    ]
                ],
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'quantity', 'category_id', 'author', 'release_year', 'description'], 'required'],
            [['quantity', 'category_id', 'release_year', 'created_at', 'updated_at'], 'integer'],
            [['description'], 'string'],
            [['title', 'author', 'cover_img_url', 'file_url'], 'string', 'max' => 255],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'title' => Yii::t('common', 'Title'),
            'quantity' => Yii::t('common', 'Quantity'),
            'category_id' => Yii::t('common', 'Category ID'),
            'author' => Yii::t('common', 'Author'),
            'release_year' => Yii::t('common', 'Release Year'),
            'description' => Yii::t('common', 'Description'),
            'cover_img_url' => Yii::t('common', 'Cover Img Url'),
            'file_url' => Yii::t('common', 'File Url'),
            'created_at' => Yii::t('common', 'Created At'),
            'updated_at' => Yii::t('common', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFavoriteBooks()
    {
        return $this->hasMany(FavoriteBook::className(), ['book_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReserveQueries()
    {
        return $this->hasMany(ReserveQuery::className(), ['book_id' => 'id']);
    }

    public function getCoverImageURL(){
        return Yii::getAlias("@storageUrl/books/covers/{$this->cover_img_url}");
    }

    public function getFileURL(){
        return Yii::getAlias("@storageUrl/books/{$this->file_url}");
    }

}
