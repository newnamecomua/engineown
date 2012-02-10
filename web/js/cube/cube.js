function start3d( img0,img1,img2,img3,img4,img5 , back_image ) {
  var screen_canvas = document.getElementById('canvas');
  var renderer = new Pre3d.Renderer(screen_canvas);

/* cube */  
  var cube = Pre3d.ShapeUtils.makeCube(1);
  Pre3d.ShapeUtils.triangulate(cube);
  
  var w = img1.width;
  var h = img1.height;

  //1  
  var texinfo0 = new Pre3d.TextureInfo();
  texinfo0.image = img0;
  texinfo0.u0 = w;   texinfo0.v0 = 0;
  texinfo0.u1 = 0;   texinfo0.v1 = 0;
  texinfo0.u2 = 0;   texinfo0.v2 = h;  
  var texinfo6 = new Pre3d.TextureInfo();
  texinfo6.image = img0;
  texinfo6.u0 = w;   texinfo6.v0 = 0;
  texinfo6.u1 = 0;   texinfo6.v1 = h;
  texinfo6.u2 = w;   texinfo6.v2 = h;
  

  //2
  var texinfo1 = new Pre3d.TextureInfo();
  texinfo1.image = img1;
  texinfo1.u0 = w;   texinfo1.v0 = 0;
  texinfo1.u1 = 0;   texinfo1.v1 = 0;
  texinfo1.u2 = 0;   texinfo1.v2 = h;
  var texinfo7 = new Pre3d.TextureInfo();
  texinfo7.image = img1;
  texinfo7.u0 = w;   texinfo7.v0 = 0;
  texinfo7.u1 = 0;   texinfo7.v1 = h;
  texinfo7.u2 = w;   texinfo7.v2 = h;
  

  //3     
  var texinfo2 = new Pre3d.TextureInfo();
  texinfo2.image = img2; 
  texinfo2.u0 = w;   texinfo2.v0 = 0;
  texinfo2.u1 = 0;   texinfo2.v1 = 0;
  texinfo2.u2 = 0;   texinfo2.v2 = h;
  var texinfo8 = new Pre3d.TextureInfo();
  texinfo8.image = img2;
  texinfo8.u0 = w;   texinfo8.v0 = 0;
  texinfo8.u1 = 0;   texinfo8.v1 = h;
  texinfo8.u2 = w;   texinfo8.v2 = h;
  

  //4
  var texinfo3 = new Pre3d.TextureInfo();
  texinfo3.image = img3;
  texinfo3.u0 = w;   texinfo3.v0 = 0;
  texinfo3.u1 = 0;   texinfo3.v1 = 0;
  texinfo3.u2 = 0;   texinfo3.v2 = h;
  var texinfo9 = new Pre3d.TextureInfo();
  texinfo9.image = img3;
  texinfo9.u0 = w;   texinfo9.v0 = 0;
  texinfo9.u1 = 0;   texinfo9.v1 = h;
  texinfo9.u2 = w;   texinfo9.v2 = h;
  
 
  //5
  var texinfo4 = new Pre3d.TextureInfo();
  texinfo4.image = img4;
  texinfo4.u0 = w;   texinfo4.v0 = 0;
  texinfo4.u1 = 0;   texinfo4.v1 = 0;
  texinfo4.u2 = 0;   texinfo4.v2 = h;
  var texinfo10 = new Pre3d.TextureInfo();
  texinfo10.image = img4;
  texinfo10.u0 = w;   texinfo10.v0 = 0;
  texinfo10.u1 = 0;   texinfo10.v1 = h;
  texinfo10.u2 = w;   texinfo10.v2 = h;
  
  
  //6
  var texinfo5 = new Pre3d.TextureInfo();
  texinfo5.image = img5;
  texinfo5.u0 = w;   texinfo5.v0 = 0;
  texinfo5.u1 = 0;   texinfo5.v1 = 0;
  texinfo5.u2 = 0;   texinfo5.v2 = h;
  var texinfo11 = new Pre3d.TextureInfo();
  texinfo11.image = img5;
  texinfo11.u0 = w;   texinfo11.v0 = 0;
  texinfo11.u1 = 0;   texinfo11.v1 = h;
  texinfo11.u2 = w;   texinfo11.v2 = h;
  




  
  function selectTexture(quad_face, quad_index, shape) {

	if(quad_index == 0)	{		renderer.texture = texinfo0;	}
	if(quad_index == 6)	{		renderer.texture = texinfo6;	}	
	
	if(quad_index == 1)	{		renderer.texture = texinfo1;	}
	if(quad_index == 7)	{		renderer.texture = texinfo7;	}	
	
	
	if(quad_index == 2)	{		renderer.texture = texinfo2;	}
	if(quad_index == 8)	{		renderer.texture = texinfo8;	}		
	
	if(quad_index == 3)	{		renderer.texture = texinfo3;	}
	if(quad_index == 9)	{		renderer.texture = texinfo9;	}			
	
	if(quad_index == 4)	{		renderer.texture = texinfo4;	}
	if(quad_index == 10){		renderer.texture = texinfo10;	}			
	
	if(quad_index == 5)	{		renderer.texture = texinfo5;	}	
	if(quad_index == 11){		renderer.texture = texinfo11;	}				


    return false;
  }
  renderer.quad_callback = selectTexture;
  renderer.fill_rgba = null;
  var state = {
    cube_rotate_y_rad: 0,
    cube_rotate_x_rad: 0,
    cube_x: 0,
    cube_y: 0
  };
/* /cube */  

  function draw() 
  {
    /* ХЗ */
	renderer.transform.reset();
  
    /* центр куба */
	renderer.transform.translate( 0, 0, 0 );
    
	/* увеличение куба */
	renderer.transform.scale(1, 1, 1);

	/* фон канваса */
    //renderer.ctx.setFillColor(1, 1, 1, 1);
	renderer.ctx.drawImage(back_image, 100 , 0 );
	//screen_canvas.drawImage(back_image,0,0);
    //renderer.drawBackground();

	/* рисуем куб */
	renderer.bufferShape(cube);

	/* рисуем буфер */
    renderer.drawBuffer();
	
  }
  renderer.camera.focal_length = 3;
  DemoUtils.autoCamera(renderer, 0, 0, -5, 0, 0, 0, draw);
  draw();
}
var img0 		= new Image();
var img1 		= new Image();
var img2 		= new Image();
var img3 		= new Image();
var img4 		= new Image();
var img5 		= new Image();
var back_image 	= new Image();

img0.src 		= '/js/cube/img/0_green.jpg';
img1.src 		= '/js/cube/img/1_blue.jpg';
img2.src 		= '/js/cube/img/2_red.jpg';
img3.src 		= '/js/cube/img/3_yellow.jpg';
img4.src 		= '/js/cube/img/4_purple.jpg';
img5.src 		= '/js/cube/img/5_marrin.jpg';

back_image.src 	= 'img/back.jpg';

back_image.onload = function() { start3d( img0,img1,img2,img3,img4,img5, back_image ); };



