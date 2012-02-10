<?php

class Solution extends fvRoot
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
        if (!$valid) $msg =  "Поле обязательное.";
        
        $inst = SolutionManager::getInstance()->getOneByurl($value);
        if (SolutionManager::getInstance()->isRootInstance($inst) && $inst->getPk() != $this->getPk()) {
            $valid = false;
            $msg = "Поле должно быть уникально.";
        }

        $this->setValidationResult('url', $valid, $msg);
        return $valid;
    }  
      
    public function getName()
    {
        return $this->getLang('name');
    }      

    public function getFullText()
    {
        return $this->getLang('full_text');
    }      
    public function getShortText()
    {
        return $this->getLang('short_text');
    }
    public function getWeight()
    {
        return $this->weight;
    } 
    public function isShow()
    {
        return (bool)$this->is_show;
    }
    public function getImageSrc($isWeb = false)
    {
        $dir = fvSite::$fvConfig->get('path.upload.solution' . ($isWeb ? "_web" : ""));
        if(!$isWeb)
            return ($this->image && file_exists($dir . $this->image) );
        return $dir . $this->image;
    }
    public function getUrl()
    {
        return $this->url;
    }
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

    public function saveImage()
    {
        $tmpImage = fvSite::$fvConfig->get('path.upload.temp_image') . $this->image;
        $dstImage = fvSite::$fvConfig->get('path.upload.solution') . $this->image;
        if(file_exists($tmpImage))  
            return @rename($tmpImage, $dstImage);
    }

    public function deleteImage()
    {
        $dstImage = fvSite::$fvConfig->get('path.upload.solution') . $this->oldImage;         
        if(file_exists($dstImage))
            return @unlink($dstImage);
        return false;
    }

    public function delete()
    {
        $this->addField('oldImage', 'string', $this->image);
        $this->deleteImage();
        return parent::delete();
    }

    
 
}
