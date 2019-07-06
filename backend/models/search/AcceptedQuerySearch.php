<?php

namespace backend\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\AcceptedQuery;

/**
 * AcceptedQuerySearch represents the model behind the search form of `common\models\AcceptedQuery`.
 */
class AcceptedQuerySearch extends AcceptedQuery
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'query_id', 'created_at', 'updated_at'], 'integer'],
            [['issue_date', 'deadline_date'], 'safe'],
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
        $query = AcceptedQuery::find();

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
            'query_id' => $this->query_id,
            'issue_date' => $this->issue_date,
            'deadline_date' => $this->deadline_date,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        return $dataProvider;
    }
}
