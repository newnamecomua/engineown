<?php

/**
 * This is the model class for table "page".
 *
 * The followings are the available columns in table 'page':
 * @property integer $id
 * @property string $techname
 * @property string $techurl
 * @property integer $metadata
 * @property string $layout_set
 */
class page extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return page the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'page';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('techname, techurl, metadata, layout_set', 'required'),
			array('metadata', 'numerical', 'integerOnly'=>true),
			array('techname, techurl', 'length', 'max'=>50),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, techname, techurl, metadata, layout_set', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'techname' => 'Techname',
			'techurl' => 'Techurl',
			'metadata' => 'Metadata',
			'layout_set' => 'Layout Set',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('techname',$this->techname,true);
		$criteria->compare('techurl',$this->techurl,true);
		$criteria->compare('metadata',$this->metadata);
		$criteria->compare('layout_set',$this->layout_set,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}