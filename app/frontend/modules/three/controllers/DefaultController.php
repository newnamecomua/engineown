<?php

class DefaultController extends FWController
{
	public function actionIndex()
	{
		$this->render('index');
	}
}