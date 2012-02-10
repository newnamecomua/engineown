function setPreload(selector,isMini){ 
    var gif = isMini ? '/img/miniload.gif' : '/img/mwait2.gif';
    jQuery(selector).html('<img src="' + gif + '"/>').show(); 
}
handlerForm = function(selector,selectorMessage,selectorData,isMini) {
   this.selector = selector;   
   this.selectorMessage = selectorMessage || '';
   this.selectorData = selectorData || '';
   this.isMini = isMini || false;      
}
handlerForm.init = function(selector,selectorMessage,selectorData,isMini){
    var obj = new handlerForm(selector,selectorMessage,selectorData,isMini);
    return obj;
}
handlerForm.prototype = {        
    $ : function(selector) { 
        if (typeof selector != 'undefined')
            return jQuery(selector);
        return jQuery; 
        
    },
    serialize : function ()
    {
        return this.$(this.selector).serialize();
    },
    confirm: function (dlog) {
        var self = this;
        self.$(dlog).dialog({
            resizable: false,
            height:140,
            modal: true,
            buttons: {                
                "Отмена": function() {
                    jQuery( this ).dialog( "close" );
                },
                "Выполнить": function() {
                    jQuery( this ).dialog( "close" );
                    self.ajax();                    
                }
            }
        });
    },
    ajax : function(onSuccess) {         
        
        var self = this;
        self.setPreload()                              
        this.$(this.selector).find('*').removeClass("ui-state-error");
        if(!self.formValidate()) {
            self.setMsg(self.getErrorMsg('Не валидные данные'));
            return false;   
        }
        
        this.$().ajax({url: this.$(this.selector).attr('action'),
                  cache: false,type: "POST",
                  data: self.serialize(),
                  async: false,
                  success: function(data,status,xhr)
                  {
                      self.onSuccessReq(self,data,status,xhr)
                      if (typeof onSuccess == 'function') {
                          onSuccess(self);
                      }
                  }
              });
    },
    getInfoMsg : function(message) {
            var msg = '';
            msg += '<div style="margin-top: 5px;" class="ui-state-highlight ui-corner-all">';
            msg += '<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span>';
            msg += '<strong style="display: block;">Info</strong>' + message + '</p></div>';
            return msg;
    },
    getErrorMsg : function(message) {
            var msg = '';
            msg += '<div style="margin-top: 5px;" class="ui-state-error ui-corner-all">';
            msg += '<p><span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>';
            msg += '<strong style="display: block;">Error</strong>' + message + '</p></div>';
            return msg;
    },
    setMsg : function(message) {
         this.$(this.selectorMessage).html(message);         
    },
    setData : function(data) {
        this.$(this.selectorData).html(data);         
    },
    setValidationResult : function(elem,is_valid,message)
    {
        if(is_valid) {
            jQuery(elem).removeClass("ui-state-error");
            jQuery(elem).attr("title","");
        } else {
            jQuery(elem).addClass("ui-state-error");
            jQuery(elem).attr("title",message);
        }    
        return is_valid;    
    },
    onSuccessReq : function (self,data,status,xhr) {
         
         var captcha = typeof xhr.getResponseHeader('captcha') == "string" ? eval(xhr.getResponseHeader('captcha')) : '';
         var exception = typeof xhr.getResponseHeader('exception') == "string" ? eval(xhr.getResponseHeader('exception')) : '';
         var message = typeof xhr.getResponseHeader('message') == "string" ? eval (xhr.getResponseHeader('message')) : '';
         self.getLocation = typeof xhr.getResponseHeader('getLocation') == "string" ? eval (xhr.getResponseHeader('getLocation')) : '';
         var validation =  '';
         if (typeof xhr.getResponseHeader('validation') == "string" && xhr.getResponseHeader('validation').length > 0) {
             eval('validation = ' + xhr.getResponseHeader('validation'));
         }         
         var redirect = typeof xhr.getResponseHeader('redirect') == "string" ? eval(xhr.getResponseHeader('redirect')) : '';
         if(validation != '') {
            for(var i in validation) {
                this.setValidationResult('#'+i, false, validation[i]);                             
            }
         }
         
         var msg = '';
         if (message != '' && typeof message != 'undefined') {
            msg += this.getInfoMsg(message);
         }
         if (exception != '' && typeof exception != 'undefined') {
            msg += this.getErrorMsg(exception);
         }
         if (redirect != '' && typeof redirect != 'undefined') {
             window.location.href = redirect;
         }
         if (captcha != '' && typeof captcha != 'undefined') {
             this.$("._captcha").html(captcha);
         }
         
         this.setMsg(msg);
         this.setData(data);         
    },
    setPreload : function(){ 
        
        var gif = this.isMini ? '/img/miniload.gif' : '/img/mwait2.gif';
        this.$(this.selectorMessage).html('<img src="' + gif + '"/>').show(); 
    },
    formValidate: function()
    {
        var self = this;
        var valid = true;
        self.$(self.selector).find(".notEmpty").removeAttr("title");
        self.$(self.selector).find(".notEmpty").removeClass("ui-state-error");
        self.$(self.selector).find(".notEmpty").each(function(){
            if(self.$(this).is('input'))
                if(self.$(this).val() <= 0)
                {
                    self.$(this).addClass("ui-state-error");                    
                    self.$(this).attr("title", "Некорректно введены данные");
                    valid = false;
                }            
            if(self.$(this).is('textarea'))
                if(self.$(this).val() <= 0)
                {
                    self.$(this).addClass("ui-state-error");
                    self.$(this).attr("title", "Некорректно введены данные");
                    valid = false;
                }
            if(self.$(this).hasClass('isEmail'))            
            {
                var email = self.$(this).val();                
                    var re = new RegExp('[a-z0-9\.\-_]+@[a-z0-9\.\-_]+\.[a-z0-9]{2,4}');
                    if(!re.exec(email))
                    {
                        self.$(this).addClass("ui-state-error");                    
                        self.$(this).attr("title", "Некорректно введены данные");
                        valid = false;
                    }                                
            }
        });
        self.$(self.selector).find(".isEmail").each(function(){            
            
                var email = self.$(this).val();
                if (email.length > 0) {
                    var re = new RegExp('[a-z0-9\.\-_]+@[a-z0-9\.\-_]+\.[a-z0-9]{2,4}');
                    if(!re.exec(email))
                    {
                        self.$(this).addClass("ui-state-error");                    
                        self.$(this).attr("title", "Некорректно введены данные");
                        valid = false;
                    }                
                }
            });
        self.$(self.selector).find(".isInn").each(function(){  
                var inn = self.$(this).val();
                var re = new RegExp('[0-9]{9}');
                if(inn && !re.exec(inn))
                {
                    self.$(this).addClass("ui-state-error");                    
                    self.$(this).attr("title", "Поле должно содержать 9 цифр от 0 до 9");
                    valid = false;
                } 
        });
        return valid;
    }
    
}

Online = function()
{
    var self = this;
}
Online.prototype = 
{
    module: '',
    getOnline: function()
    {
       var self = this; 
       jQuery.post('/'+self.module+'/getonline', function(r,s,xhr){
           self.showDialog(r);
       }); 
    },
    getHistory: function(date)
    {
        var self = this;
        self.showLoad(true);
        jQuery.post('/'+self.module+'/gethistory', {date:date}, function(r,s,xhr){
            self.showLoad(false);
            jQuery("#box_day_history").html(r);
        });          
    },
    showDialog: function(html)
    {
        jQuery("<div title='Статистика онлайн'>" + html + "</div>").appendTo("body").dialog({
            modal:true,
            width:600,
            height:600,
            resizable: false,
            close: function(){jQuery(this).remove()}
        });
    }, 
    initDate: function(box)
    {
        var self = this;
        jQuery(box).datepicker({
            dateFormat: 'dd.mm.yy',
            maxDate: "+1D",
            showAnim: "clip",
            onSelect:  function(dateText, inst)
            {
                self.getHistory(dateText);
            }
        })
    },
    showLoad: function(trigger)
    {
        if(trigger)
            jQuery("#box_day_history").html("<img id='loadTrig' src='/img/mwait2.gif' />");
        else {
            jQuery("#loadTrig").remove();
        }
    },
    viewMore: function(id, a)
    {
        jQuery(".view_more_info_" + id).slideToggle('slow', function(){
        if(jQuery(".view_more_info_" + id).css('display') == 'block')
            jQuery(a).text("Скрыть");
        if(jQuery(".view_more_info_" + id).css('display') == 'none')
            jQuery(a).text("Подробнее...");
        });
    },
    getCountOnline: function()
    {
        var self = this;
        jQuery.post('/' + self.module + '/getcountonline', function(r,s,xhr){
           eval('var count = ' + xhr.getResponseHeader('countOnline') );
           count = typeof count != 'undefined' ? count : 0;
           jQuery("#linkUserCount").html("Пользователей онлайн: " + count); 
        });
    }
}

_online = new Online();



//Сохранение данных по аяксу
(function($) {
    $.fn.formAjax = function(options) {

        var defaults = {
            callback: function(){ window.location.href="/order/"; }
        };

        var opts = $.extend(defaults, options);

        this.find( "input, textarea" ).focus(function(){
            $(this).removeClass( "error" ).attr({title: ''});
        });

        this.submit(function(){
            var iForm = jQuery( this );

            jQuery.ajax({
                url: iForm.attr( 'action' ),
                type: iForm.attr( 'method' ),
                data: iForm.serialize(),
                success: function( data, status, xhr )
                {
                    try
                    {
                        iForm.find( ".error" ).removeClass( "error" );

                        var h = jQuery.parseJSON( xhr.getResponseHeader( "actionmessage" ) );
                        if ( h.type == "error" )
                            {
                            var v = jQuery.parseJSON( xhr.getResponseHeader( "X-JSON" )  );
                            for ( var field in v  )
                                {
                                iForm.find( "#"+field ).addClass( "error" ).attr({ title: v[field] });
                            }

                            jQuery( "<p>" + h.message + "</p>" ).splash({header: "Ошибка"});
                        }
                        else
                            {
                            jQuery( "<p>" + h.message + "</p>" ).splash({header: "Сохранено", callback: opts.callback( iForm ) });
                        }
                    }
                    catch( e )
                    {
                        jQuery( "<p>Во время выполнения возникла ошибка.</p>" ).splash({header: "Ошибка"});   
                    }
                    $( "form#subscribe-form .placeholder" ).placeholder();  
                }
            });

            return false;
        });
    };    
})(jQuery); 

//Всплывающее окошко
(function($) {
    $.fn.splash = function(options) {

        var defaults = {
            header: "",
            callback: function(){}
        };

        var opts = $.extend(defaults, options);
        var self = this;

        var wrapper = jQuery( "<div class='splash'><p>"+opts.header+"</p><p>"+this.html()+"</p><a class='close' href='javascript:void(0)'>Закрыть</a></div>" );
        wrapper.find( "a.close" )
        .click(function(){
            jQuery(this).parents( "div.splash" ).fadeOut( "300", function(){
                $(this).remove();  
            })
            opts.callback();
        });

        wrapper.appendTo( jQuery( "body" ) ).fadeIn( "200" );
        window.setTimeout( function(){
            if (wrapper)
                {
                wrapper.fadeOut( "300", function(){
                    $(this).remove();
                    opts.callback();    
                });
            }
        }, 5000 );

    };    
})(jQuery);

//Рыбина для тектовых полей
(function($) {
    $.fn.placeholder = function(options) {

        var defaults = {
        };

        var opts = $.extend(defaults, options);
        this.each(function(){
            $(this).focus(function(){
                if( $(this).val() == $(this).attr( 'alt' ) )   
                    $(this).val('').removeClass( "inactive" );
            });

            $(this).blur(function(){
                if ( $(this).val().length == 0 )
                    $(this).val( $(this).attr( 'alt' ) ).addClass( "inactive" );    
            });

            $(this).parents("form").eq(0).submit(function(){
                $(this).find(".placeholder").each(function(){
                    if( $(this).val() == $(this).attr( 'alt' ) )   
                        $(this).val('');    
                }); 
            });

            $(this).blur();
        });

        return this;

    };    
})(jQuery);  
