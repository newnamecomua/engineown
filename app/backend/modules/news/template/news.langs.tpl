<fieldset>
    <legend class='toggler'>Языковая информация {$fvConfig->get("languages.$lang.legend")}</legend>

    <div class="toggle_content" {if !$fvConfig->get("languages.$lang.default")}style="display:none;"{/if}>    
        
        <label>Загловок</label>
        <input type="text" id="name_{$lang}" name="m[name_{$lang}]" value="{$ex->getLang(name,$lang)}" class="full" /><br />
        
        <label for='heading'>Короткий текст</label>
        <textarea name="m[heading_{$lang}]" id="heading_{$lang}" style="width:400px;">{$ex->getLang(heading,$lang)}</textarea><br />
        
        <label for='text'>Основной текст</label>
        <textarea name="m[text_{$lang}]" id="text_{$lang}" style="width:700px; display: inline-block;" class="editor">{$ex->getLang(text,$lang)}</textarea><br />
        
        
    </div>

</fieldset>