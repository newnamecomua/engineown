(function($) {  
	
	var CUBE3D = function(element, options){
		//Defaults are below
		var settings = $.extend({}, $.fn.cube3d.defaults, options);

		var screen_canvas,
			renderer,
			cube,
			w,
			h,
			textureInfoArr  = Array(),
			imagesArr		= Array(),
			face_images		= Array(),
			back_image		= new Image(),
			state = {
				cube_rotate_y_rad	 : 0,
				cube_rotate_x_rad	 : 0,
				cube_rotate_z_rad	 : 0,
				rotate_x_destination : 0,
				rotate_y_destination : 0,
				rotate_z_destination : 0,
				cube_x				 : 0,
				cube_y				 : 0,
				runing 				 : false,
				ticker 				 : null,
				activeSide	 : 1
			};
			
		var MakeCanvas = function(){
			//jQuery(element).append('<canvas id="cube3dcanvas" width="800" height="725" ></canvas>');
			jQuery(element).append('<canvas id="cube3dcanvas" width="840" height="840" ></canvas>');
			jQuery(element).append('<div id="cube3dright"></div>');
			jQuery(element).append('<div id="cube3dleft"></div>');
			jQuery(element).append('<div id="cube3dtop"></div>');
			jQuery(element).append('<div id="cube3dbottom"></div>');
			
			screen_canvas = (jQuery(element).find('#cube3dcanvas'))[0];
		};
			
		var TexturePrepareImg = function(){
			for(var i=0, j=0; i<12; i++,j++){
				if(j>5){ j=0;}
				imagesArr[i] 	 = new Image();				
				imagesArr[i].src = face_images[j];
			}
		};
		
		var TextureInfoFabrica = function(){
			for(var i=0; i<12; i++){
				textureInfoArr[i] 		= new Pre3d.TextureInfo();
				textureInfoArr[i].image = imagesArr[i];
				if(i<6){
					stretchTextureLT(textureInfoArr[i]);
				}
				if(i>=6){
					stretchTextureRT(textureInfoArr[i]);
				}		
			}
		};

		var stretchTextureLT = function( TextureInfo ){
			TextureInfo.u0 = w;    TextureInfo.v0 = 0;
			TextureInfo.u1 = 0;   		TextureInfo.v1 = 0;
			TextureInfo.u2 = 0;   		TextureInfo.v2 = h;  
		};

		var stretchTextureRT = function( TextureInfo ){
			TextureInfo.u0 = w;    TextureInfo.v0 = 0;
			TextureInfo.u1 = 0;   		TextureInfo.v1 = h;
			TextureInfo.u2 = w;    TextureInfo.v2 = h;
		};

		var selectTexture = function(quad_face, quad_index, shape) {
			renderer.texture = textureInfoArr[quad_index];
			return false;
		};
		
		var draw = function(){
			/* ??? */
			renderer.transform.reset();
  
			/* center of cube */
			
    renderer.transform.rotateX(state.cube_rotate_x_rad);
    renderer.transform.rotateY(state.cube_rotate_y_rad);
	renderer.transform.rotateZ(state.cube_rotate_z_rad);

	
			renderer.transform.translate( 0, 0, 0 );
    
			/* zoom cube */
			renderer.transform.scale(1, 1, 1);

			/* cube out into buffer */
			renderer.bufferShape( cube );

			/* clean "durty" background */
			renderer.ctx.drawImage(back_image, 0 , 0 );		
	
			/* buffer come out */
			renderer.drawBuffer();
			
			var s = "state.cube_rotate_y_rad 	: " +	state.cube_rotate_y_rad + "<br>"+
					"state.cube_rotate_x_rad 	: " +	state.cube_rotate_x_rad + "<br>"+
					"state.rotate_x_destination : " +	state.rotate_x_destination + "<br>"+
					"state.rotate_y_destination : " +	state.rotate_y_destination + "<br>"+
					"state.cube_x 				: " +	state.cube_x + "<br>"+
					"state.cube_y 				: " +	state.cube_y + "<br>"+
					"state.runing 				: " +	state.runing + "<br>"+
					"state.activeSide 			: " +	state.activeSide + "<br>";
			
			jQuery("#info").html(s);

		};
		
		var turnRight = function(){            
            var step = ( (Math.PI/2) / 9 );
			if(turnRight.stop == null || turnRight.stop === 'undefined' )
			{
				turnRight.stop = state.cube_rotate_y_rad + (Math.PI/2);
			}
			
			if( state.cube_rotate_y_rad + step < turnRight.stop )
			{
				state.cube_rotate_y_rad += step;
				draw();
			}
			else
			{
				state.running = false;
				if((state.cube_rotate_y_rad+0.1) >= (2*Math.PI)){
					turnRight.stop = 0;
				}
				state.cube_rotate_y_rad = turnRight.stop;
				turnRight.stop = null;
				state.ticker.stop();
				draw();
                
                var spconteiner = "#_staticPageContainer_" + state.activeSide;
                jQuery(spconteiner).show();
                jQuery("canvas").css("visibility" , "hidden");
                initScrollPotContent();
                
			}
		};

		var turnLeft = function(){
			
			var step = ( (Math.PI/2) / 9 );
			if(turnLeft.stop == null || turnLeft.stop === 'undefined' )
			{
				turnLeft.stop = state.cube_rotate_y_rad - (Math.PI/2);
			}
			
			if( state.cube_rotate_y_rad - step > turnLeft.stop )
			{
				state.cube_rotate_y_rad -= step;
				draw();
			}
			else
			{
				state.running = false;
				if((state.cube_rotate_y_rad-0.1) <= (-(2*Math.PI))){
					turnLeft.stop = 0;
				}
				state.cube_rotate_y_rad = turnLeft.stop;
				turnLeft.stop = null;
				state.ticker.stop();
				draw();
                
                var spconteiner = "#_staticPageContainer_" + state.activeSide;
                jQuery(spconteiner).show();
                jQuery("canvas").css("visibility" , "hidden");
                initScrollPotContent();
                
			}
		};

		var turnTop = function(){
			
			var step = ( (Math.PI/2) / 9 );
			if(turnTop.stop == null || turnTop.stop === 'undefined' )
			{
				turnTop.stop = state.cube_rotate_x_rad - (Math.PI/2);
			}
			
			if( state.cube_rotate_x_rad - step > turnTop.stop )
			{
				state.cube_rotate_x_rad -= step;
				draw();
			}
			else
			{
				state.running = false;
				if(state.cube_rotate_x_rad >= (2*Math.PI)){
					turnTop.stop = 0;
				}
				state.cube_rotate_x_rad = turnTop.stop;
				turnTop.stop = null;
				state.ticker.stop();
				draw();
			}
		};

		var turnBottom = function(){
			
			var step = ( (Math.PI/2) / 9 );
			if(turnBottom.stop == null || turnBottom.stop === 'undefined' )
			{
				turnBottom.stop = state.cube_rotate_z_rad + (Math.PI/2);
			}
			
			if( state.cube_rotate_z_rad + step < turnBottom.stop )
			{
				state.cube_rotate_z_rad += step;
				draw();
			}
			else
			{
				state.running = false;
				if(state.cube_rotate_z_rad >= (2*Math.PI)){
					turnBottom.stop = 0;
				}
				state.cube_rotate_z_rad = turnBottom.stop;
				turnBottom.stop = null;
				state.ticker.stop();
				draw();
			}
		};
		
        $('div#cube3dright').live('click', function(){
			if( !state.running ){
                
                var spconteiner = "#_staticPageContainer_" + state.activeSide;
                jQuery(spconteiner).hide();
                jQuery("canvas").css("visibility" , "visible");
                
                
				state.ticker = new DemoUtils.Ticker(24, turnRight);
				state.running = true;
				state.ticker.start();
				state.activeSide = state.activeSide +1;
				if(state.activeSide == 5){state.activeSide =1;}
                
			}
        });
		
        $('div#cube3dleft').live('click', function(){
			if( !state.running ){

                var spconteiner = "#_staticPageContainer_" + state.activeSide;
                jQuery(spconteiner).hide();
                jQuery("canvas").css("visibility" , "visible");


				state.ticker = new DemoUtils.Ticker(24, turnLeft);
				state.running = true;
				state.ticker.start();
				state.activeSide = state.activeSide -1;
				if(state.activeSide == 0){state.activeSide =4;}
                
				
			}
        });
		
        $('div#cube3dtop').live('click', function(){
			if( !state.running ){
				state.ticker = new DemoUtils.Ticker(24, turnTop);
				state.running = true;
				state.ticker.start();
			}
        });

        $('div#cube3dbottom').live('click', function(){
			if( !state.running ){
				state.ticker = new DemoUtils.Ticker(24, turnBottom);
				state.running = true;
				state.ticker.start();
			}
        });
		
		var init = function(){
			renderer 	    				= new Pre3d.Renderer(screen_canvas),
			renderer.fill_rgba 				= null;
			renderer.quad_callback			= selectTexture;
//			renderer.camera.focal_length 	= 10;		
			renderer.camera.focal_length 	= 3;		
			cube 		    				= Pre3d.ShapeUtils.makeCube(1),
			w 			    				= settings.width,
			h 			    				= settings.height,
			face_images	 					= settings.face_img_files;
			back_image.src					= settings.back_img_file;
			
			
			TexturePrepareImg();
			TextureInfoFabrica();
			Pre3d.ShapeUtils.triangulate(cube);  
			//DemoUtils.autoCamera(renderer, 0, 0, -14.8, 0, -(Math.PI/2), 0, draw);
			//DemoUtils.autoCamera(renderer, 0, 0, -5.15, 0, 0, 0, draw);
			DemoUtils.autoCamera(renderer, 0, 0, -5.15, 0, -(Math.PI/2), 0, draw);
		} 
		MakeCanvas();
		init();
		draw();
	}
	$.fn.cube3d = function(options) {
        return this.each(function(key, value){
            var element = $(this);
            // Return early if this element already has a plugin instance
            if (element.data('cube3d')) return element.data('cube3d');
            // Pass options to plugin constructor
            var cube3d = new CUBE3D(this, options);
            // Store plugin object in this element's data
            element.data('cube3d', cube3d);
        });	
	};
	
	$.fn.cube3d.defaults = {
		//'face_img_files' : Array('face_00.jpg','face_01.jpg','face_02.jpg','face_03.jpg','face_04.jpg','face_05.jpg'),
		'face_img_files' : Array('/img/side_01_back.png','/img/side_02_back.png','/img/side_03_back.png','/img/side_04_back.png','/img/side_back.png','/img/side_back.png'),
		'back_img_file'  : '/img/wallpaper.png',
		'width'			 : 608,
		'height'		 : 608
	};
	
})(jQuery);

function showCanvas(button){
    jQuery("#canvas").show();
    jQuery(button).click();
}
jQuery(document).ready(function(){
    jQuery('.vbut_02').click(showCanvas("#cube3dright"));    
    jQuery('.vbut_05').click(showCanvas("#cubcube3dleft"));    
});
    

    