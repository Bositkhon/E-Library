<?php

namespace backend\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Book;

/**
 * BookSearch represents the model behind the search form of `common\models\Book`.
 */
class BookSearch extends Book
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'quantity', 'category_id', 'release_year', 'created_at', 'updated_at'], 'integer'],
            [['title', 'author', 'description', 'cover_img_url', 'file_url'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Book::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'quantity' => $this->quantity,
            'category_id' => $this->category_id,
            'release_year' => $this->release_year,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'author', $this->author])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'cover_img_url', $this->cover_img_url])
            ->andFilterWhere(['like', 'file_url', $this->file_url]);

        return $dataProvider;
    }
}
