<div class="feedback">
    <div style="display: none;">
        {$lang->form_invalid_email}
        {$lang->form_valid_error}
        {$lang->form_invalid_notempty}
        {$lang->form_label_phone}
        {$lang->feedback_success}
        {$lang->form_invalid_captcha}
        {$lang->form_save_error}
        {$lang->content}
        {$lang->form_label_theme}
        {$lang->feedback_invalid_captcha}
        {$lang->feedback_valid_error}    
    </div>
    <div id="feedbackMessage">
        
    </div>
    <form action="{$module}/save" class="form_style_one m_mb50" id="feedbackForm">
        <div class="header">
            <p>Чтобы задать нам вопрос либо высказать свои пожелания, пожалуйста, заполните все поля формы.</p>    
        </div>
        <div class="middle">
            <div class="unit">

                <label>{$lang->form_label_name}*:</label>
                <input type="text" maxlength="255" name="m[name]" id="name" value=""/>
            </div>
            <div class="unit">
                <label>{$lang->form_label_email}:</label>
                <input type="text" maxlength="255" name="m[email]" id="email" value=""/>
            </div>
            <div class="unit">
                <label>{$lang->form_label_theme}:</label>
                <input type="text" maxlength="255" name="m[phone]" id="phone" value=""/>
            </div>
            <div class="unit">
                <label>{$lang->form_label_message}</label>
                <textarea name="m[message]" id="message" rows="10" cols="45" ></textarea>
            </div>
            <div class="unit captcha">                
                {*<label>{$lang->form_label_captcha}</label>*}
                <div class="empty"></div>
                <div class="_captcha">{$captcha->render()}</div>                
                <input type="text" name="captcha[text]" value="" />
            </div>
            <div class="unit">
            
                <div class="btn" style="margin-left:126px;">
                    <a href="javascript:void(0);" onclick="javascript: handlerForm.init('#feedbackForm','#feedbackMessage').ajax(); return false;">{$lang->form_button_submit}</a>
                </div>
            </div>
        </div>
    </form>  
</div>
