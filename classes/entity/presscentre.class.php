<?php

class PressCentre extends fvRoot
{
    protected $currentEntity = ''; 
    
    function __construct () 
    {
        $this->currentEntity = __CLASS__;
        parent::__construct(fvSite::$fvConfig->get("entities.{$this->currentEntity}.fields"),
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.table_name"),
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.primary_key", "id"));
    }
      
    function validateName_ru($value)
    {
        $valid = $this->doValidateEmpty($value);
        $this->setValidationResult('name_ru', $valid, "Поле обязательное");
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
    public function getName()
    {
        return $this->getLang('name');
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
    * Получить ссылку на изображение
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return string
    */
    public function getFileSrc($isWeb = false)
    {
        $dir = fvSite::$fvConfig->get('path.upload.press_centre' . ($isWeb ? "_web" : ""));
        if(!$isWeb)
            return ($this->file && file_exists($dir . $this->file) );
        return $dir . $this->file;
    }
    /**
    * Получить ссылку на изображение
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return string
    */
    public function getIconSrc($isWeb = false)
    {
        $dir = fvSite::$fvConfig->get('path.upload.press_centre' . ($isWeb ? "_web" : ""));
        if(!$isWeb)
            return ($this->icon && file_exists($dir . $this->icon) );
        return $dir . $this->icon;
    }
    
    /**
    * Сохроненние
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function save($logging = true)
    {
        if($this->hasField('oldFile'))
        {
            if($this->oldFile != $this->file)
            {
                $this->deleteFile();
                $this->saveFile();                
            }
            $this->removeField('oldFile');
        }
        if($this->hasField('oldIcon'))
        {
            if($this->oldIcon != $this->icon)
            {
                $this->deleteIcon();
                $this->saveIcon();                
            }
            $this->removeField('oldIcon');
        }
        return parent::save($logging);
    }
    /**
    * Сохранить file
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function saveFile()
    {
        $tmpFile = fvSite::$fvConfig->get('path.upload.temp_image') . $this->file;
        $dstFile = fvSite::$fvConfig->get('path.upload.press_centre') . $this->file;
        if(file_exists($tmpFile))  
            return rename($tmpFile, $dstFile);
    }
    /**
    * Сохранить file
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function saveIcon()
    {
        $tmpFile = fvSite::$fvConfig->get('path.upload.temp_image') . $this->icon;
        $dstFile = fvSite::$fvConfig->get('path.upload.press_centre') . $this->icon;
        if(file_exists($tmpFile))  
            return rename($tmpFile, $dstFile);
    }
    /**
    * Удалить file
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function deleteFile()
    {
        $dstFile = fvSite::$fvConfig->get('path.upload.press_centre') . $this->oldFile;         
        if(file_exists($dstFile))
            return @unlink($dstFile);
        return false;
    }
    /**
    * Удалить file
    * @author Nesterenko Nikita
    * @since 2011/08/25
    * @return bool
    */
    public function deleteIcon()
    {
        $dstFile = fvSite::$fvConfig->get('path.upload.press_centre') . $this->oldIcon;         
        if(file_exists($dstFile))
            return @unlink($dstFile);
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
        $this->addField('oldFile', 'string', $this->file);
        $this->addField('oldIcon', 'string', $this->icon);
        $this->deleteFile();
        $this->deleteIcon();
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
