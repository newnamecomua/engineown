<?php

class Advertise extends fvRoot
{
    protected $currentEntity = ''; 
    
    function __construct () 
    {
        $this->currentEntity = __CLASS__;
        parent::__construct(fvSite::$fvConfig->get("entities.{$this->currentEntity}.fields"),
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.table_name"),
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.primary_key", "id"));
    }
      
    function validateTitle_ru($value)
    {
        $valid = $this->doValidateEmpty($value);
        $this->setValidationResult('title', $valid, "Поле обязательное");
        return $valid;
    }  
      
    function validateUrl($value)
    {
        $valid = $this->doValidateEmpty($value);
        if($valid)
            $valid = $this->doValidateUniq($value, "url");
        $this->setValidationResult('url', $valid, "Поле обязательное и должно быть уникальным");
        return $valid;
    }  
      
    /**
    * Получить заголовок
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return string
    */
    public function getTitle()
    {
        return $this->getLang('title');
    }      
      
    /**
    * Получить вес
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return string
    */
    public function getWeight()
    {
        return $this->weight;
    } 
    /**
    * Отображать или нет
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function isShow()
    {
        return (bool)$this->is_show;
    }
    /**
    * Открывать в новом окне или нет
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function isTarget()
    {
        return (bool)$this->is_target;
    }
    /**
    * Получить ссылку на изображение
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return string
    */
    public function getImageSrc($isWeb = false)
    {
        $dir = fvSite::$fvConfig->get('path.upload.advertise' . ($isWeb ? "_web" : ""));
        if(!$isWeb)
            return ($this->image && file_exists($dir . $this->image) );
        return $dir . $this->image;
    }
    
    /**
    * Сохроненние
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function save($logging = true)
    {
        if($this->hasField('oldImage'))
        {
            if($this->oldImage != $this->image)
            {
                $this->deleteImage();
                $this->saveImage();                
            }
            $this->removeField('oldImage');
        }
        return parent::save($logging);
    }
    /**
    * Сохранить изображение
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function saveImage()
    {
        $tmpImage = fvSite::$fvConfig->get('path.upload.temp_image') . $this->image;
        $dstImage = fvSite::$fvConfig->get('path.upload.advertise') . $this->image;
        if(file_exists($tmpImage))  
            return @rename($tmpImage, $dstImage);
    }
    /**
    * Удалить изображение
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function deleteImage()
    {
        $dstImage = fvSite::$fvConfig->get('path.upload.advertise') . $this->oldImage;         
        if(file_exists($dstImage))
            return @unlink($dstImage);
        return false;
    }

    /**
    * Удаление
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function delete()
    {
        $this->addField('oldImage', 'string', $this->image);
        $this->deleteImage();        
        return parent::delete();
    }
    
    /**
    * Получить УРЛ
    * @author Nesterenko Nikita
    * @since 2011/09/19
    * @return string
    */
    public function getUrl()
    {
        return $this->url;
    }
    
 
}
