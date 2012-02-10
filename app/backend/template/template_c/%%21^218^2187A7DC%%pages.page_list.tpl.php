<?php /* Smarty version 2.6.21, created on 2012-02-02 16:47:55
         compiled from pages.page_list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'pages.page_list.tpl', 43, false),array('modifier', 'replace', 'pages.page_list.tpl', 195, false),array('function', 'html_options', 'pages.page_list.tpl', 48, false),array('function', 'localization', 'pages.page_list.tpl', 78, false),array('block', 'tabs', 'pages.page_list.tpl', 77, false),)), $this); ?>
<table>
  <tr>
    <td id="leftpanel" valign="top">
        <div id="leftpaneldiv">
            <a href="javascript:void(0);" id="hidePanel"><img id="collapse" src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/collapse.gif" width="15" height="15"></a>
            <div class="header" id="leftPanelHeader">Список страниц</div>
            <div id="leftpaneldata" style="height:600px; overflow-y:scroll;">
                <?php $_from = $this->_tpl_vars['Pages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['onePage']):
?>
                    <div style="float: right">
        <A
           href="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/?id=<?php echo $this->_tpl_vars['onePage']->getPk(); ?>
"
        onclick="go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/?id=<?php echo $this->_tpl_vars['onePage']->getPk(); ?>
'); return false;"
        ><img src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/edit_icon.png" title="редактировать" width="16" height="16"></a><?php if ($this->_tpl_vars['onePage']->page_name != 'default'): ?><a
           href="javascript: void(0);"
        onclick="if (confirm('Вы действительно желаете удалить страницу. Все дочерние страницы перенесутся в корень.')) go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/delete/?id=<?php echo $this->_tpl_vars['onePage']->getPk(); ?>
'); return false;"
        ><img src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/delete_icon.png" title="удалить" width="16" height="16"></a><?php endif; ?>
                    </div><div><?php if ($this->_tpl_vars['onePage']->page_parent_id): ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php endif; ?><?php echo $this->_tpl_vars['onePage']->page_name; ?>
</div><div style="clear: both;">
                <?php endforeach; endif; unset($_from); ?>

                <div class="operation">
                    <a href="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/" onclick="go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/'); return false;" class="add">добавить</a>
                </div>
            </div>
        </div>
    </td>
    <td class="spacer">&nbsp;</td>
    <td id="datapanel">
<FORM method="post" action="/backend/pages/save/">
<div class="form">
    <H1><?php if ($this->_tpl_vars['Page']->isNew()): ?>Добавление страницы<?php else: ?>Редактирование страницы '<?php echo $this->_tpl_vars['Page']->page_name; ?>
'<?php endif; ?></H1>
    <?php if ($this->_tpl_vars['Page']->page_name == 'default'): ?>
    <p>Эта страница используется как базовая для задания основных параметров, таких как:</p>
    <ul class="num">
        <li>Основные мета-теги (если те не указаны в новых страницах.)</li>
        <li>Основные модули, которые будут присутствовать на новой странице</li>
    </ul>

    <?php else: ?>
    <fieldset>
        <legend>Общая информация</legend>
        <table class="form">
        <tr><td style="width: 1px;">
        <label for="page_name">Название</label></td><td> <input type="text" id="page_name" name="p[page_name]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['Page']->page_name)) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"/>
        </td></tr><tr><td>
        <label for="page_url">Урл страницы</label></td><td><input type="text" id="page_url" name="p[page_url]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['Page']->page_url)) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" /> <br />        
        </td></tr><tr><td>
        <label for="page_parent_id">Родительская страница</label></td><td>
        <?php echo smarty_function_html_options(array('name' => "p[page_parent_id]",'id' => 'page_parent_id','options' => $this->_tpl_vars['PageManager']->htmlSelect('page_name',"","page_parent_id = 0 and page_name <> 'default' AND id <> ?",'','',$this->_tpl_vars['Page']->getPk()),'selected' => $this->_tpl_vars['Page']->page_parent_id), $this);?>

        </td></tr>
        </table>
    </fieldset>
    <?php endif; ?>
    
    <fieldset>
        <legend>Javascript/CSS</legend>
        <table class="form" id="jscss">
        <tr>
            <td style="width: 50%;">
                <fieldset>
                    <legend>Javascript <a href='javascript:void(0);' onclick='javascript:window.addJS();' title='добавить javascript'><img src='/backend/img/add.png' /></a></legend>
                    <div id='jsbody'><?php $_from = $this->_tpl_vars['JS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ex']):
?><div><input style='width:80%;' type='text' name='p[js][]' value='<?php echo ((is_array($_tmp=$this->_tpl_vars['ex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
'><a href='javascript:void(0);' onclick='javascript:jQuery(this).parent().html("");jQuery(this).parent().hide();' title='удалить'><img src='/backend/img/delete.png' /></a></div><?php endforeach; endif; unset($_from); ?></div>
                </fieldset>
            </td>
            <td style="width: 50%;">
                <fieldset>
                    <legend>CSS <a href='javascript:void(0);' onclick='javascript:window.addCSS();' title='добавить css'><img src='/backend/img/add.png' /></a></legend>
                    <div id='cssbody'><?php $_from = $this->_tpl_vars['CSS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ex']):
?><div><input style='width:80%;' type='text' name='p[css][]' value='<?php echo ((is_array($_tmp=$this->_tpl_vars['ex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
'><a href='javascript:void(0);' onclick='javascript:jQuery(this).parent().html("");jQuery(this).parent().hide();' title='удалить'><img src='/backend/img/delete.png' /></a></div><?php endforeach; endif; unset($_from); ?></div>
                </fieldset>
            </td>
        </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>Мета-информация</legend>
        <table class="form">
        <tr><td style="width: 1px;">
        <?php $this->_tag_stack[] = array('tabs', array('items' => $this->_tpl_vars['Lang']->getLangs())); $_block_repeat=true;smarty_block_tabs($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
            <?php echo smarty_function_localization(array('object' => $this->_tpl_vars['Page']->getMeta(),'langs' => $this->_tpl_vars['Lang']->getLangs(),'name' => "meta[]"), $this);?>

        <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_tabs($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
        </td>        
        </tr>        
        </table>                                                     
    </fieldset>
    <fieldset>
        <legend>Теги</legend>
        <table class="form">
            <tr>
                <td style="width: 1px;">
                <?php $_from = $this->_tpl_vars['metaManager']->getListTag(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['_tag'] => $this->_tpl_vars['_name']):
?>
                    %<?php echo $this->_tpl_vars['_tag']; ?>
% : <?php echo $this->_tpl_vars['_name']; ?>
<br />
                <?php endforeach; endif; unset($_from); ?>        
                </td>        
            </tr>        
        </table>                                                     
    </fieldset>

    <div class="operation">
        <a href="javascript: void(0);" class="content_edit" id="content_edit"
            onclick=""
        >управление содержимым страницы</a>
        <br clear="all">
    </div>

    <div class="buttonpanel">
        <input type="submit" name="save" value="Сохранить" class="button">
    </div>
    <input type="hidden" name="id" id="id" value="<?php echo $this->_tpl_vars['Page']->getPk(); ?>
" />
    <input type="hidden" name="p[page_content]" id="page_content" value="<?php if (! $this->_tpl_vars['Page']->isNew()): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['Page']->getPageContent())) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
<?php endif; ?>" />
</div>
</FORM>
    </td>
  </tr>
</table>
<div id='jscont' style='display:none;'><div><input style='width:80%;' type='text' name='p[js][]'><a href='javascript:void(0);' onclick='javascript:jQuery(this).parent().html("");jQuery(this).parent().hide();' title='удалить'><img src='/backend/img/delete.png' /></a></div></div>
<div id='csscont' style='display:none;'><div><input style='width:80%;' type='text' name='p[css][]'><a href='javascript:void(0);' onclick='javascript:jQuery(this).parent().html("");jQuery(this).parent().hide();' title='удалить'><img src='/backend/img/delete.png' /></a></div></div>
<div style="display: none" id="headers_content">
    <div class="popup_content">
        <a href="javascript: void(0)">SERVER_NAME</a> - заголовок статической страницы<br />
    </div>
</div>

<?php echo '
<script>
    Object.extend(window, {
        insertArea: \'\',
        
        addJS: function()
        {
            var elem = document.createElement("div");
            elem.innerHTML = $("jscont").innerHTML;
            jQuery("#jsbody").append(elem);
        },
        
        addCSS: function()
        {
            var elem = document.createElement("div");
            elem.innerHTML = $("csscont").innerHTML;
            jQuery("#cssbody").append(elem);
        }
    });

    function moveLeftPanel (e) {
        if ($(\'leftpanel\').getDimensions().width > 100) {
            $(\'leftpanel\').morph(\'width: 20px;\');
            $(\'leftPanelHeader\').update("");
            $(\'leftpaneldata\').hide();
            $(\'collapse\').src = \''; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/expand.gif<?php echo '\';
        } else {
            $(\'leftpanel\').morph(\'width: 300px;\');
            $(\'collapse\').src = \''; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/collapse.gif<?php echo '\';
            setTimeout("$(\'leftPanelHeader\').update(\'Список страниц\')", 1000);
            setTimeout("$(\'leftpaneldata\').show()", 1000);
        }
    }

    var helpwindow = new PopUpWindow({
        width: 400,
        height: 300,
        center: true,
        title: "заголовки",
        name: \'headers\',
        buttons: [\'cancel\'],
        contentData: $(\'headers_content\').innerHTML,
        zIndex: 120
    });

    $$("table#metatags tr td a").each(function (link){
        link.observe("click", function (evt) {
            helpwindow.show();
        });
    })

    $$(\'div.popup_content a\').each(function (link) {
        link.observe(\'click\', function (evt) {
            elem = Event.element(evt);
            helpwindow.close();
            if ($(window.insertArea)) {
                $(window.insertArea).value = $F(window.insertArea) + \'%\' + elem.innerHTML + \'%\';
            }
        })
    });

    var wnd = new PopUpWindow({
        width: 800,
        height: 600,
        center: true,
        url: \'/backend/\',
        title: "управление содержимым",
        name: \'content_edit\',
        zIndex: 100,
        onShow: function (params) {            
            new Ajax.Updater(\'content_edit_content\', \''; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/contentedit/<?php echo '\', {
                parameters: 
                {
                    _xmlContent: $F("page_content") || \''; ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['Page']->getPageContent())) ? $this->_run_mod_handler('replace', true, $_tmp, "\n", "") : smarty_modifier_replace($_tmp, "\n", "")); ?>
<?php echo '\'.replace("&lt;?xml version=&quot;1.0&quot;?&gt;", "&lt;?xml version=&quot;1.0&quot;?&gt;\\n")
                },
                evalScripts: true
            });
        },
        onOk: function (params) {
            $(\'page_content\').value = $F(\'_xmlContent\');
        }
    });

    $(\'leftpaneldiv\').setStyle({
        height: (document.viewport.getHeight() - $(\'header\').getDimensions().height - 25) + "px"
    });

    $(\'hidePanel\').observe(\'click\', moveLeftPanel);
    $(\'content_edit\').observe(\'click\', wnd.show.bind(wnd));
</script>
'; ?>