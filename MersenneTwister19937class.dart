#import('dart:html');
#import('MersenneTwister19937.dart');
class MersenneTwister19937class {

  MersenneTwister19937class() {
  }

  uniform_left_sp(var n, var p) {
    var s = n.toString();
    for (var i = p - s.length; i > 0; --i) {
      s = "&nbsp;" + s;
    }
    return s;
  }
  
  uniform_right_0(var n, var p) {
    String s = n.toString();
    if (s.indexOf('.', 0)<0) {
      s+=".0";
    }
   
    for (var i = p - s.length; i > 0; --i) {
      s += "0";
    }
    
    return s;
  }  
  
  void run() {
    //write("Hello World!");
    var mt1 = genrand_int32();
    genrand_real2(mt1);
    genrand_int31(mt1);
    genrand_real1(mt1);
    genrand_real3(mt1);
    genrand_res53(mt1);
    //graph(mt1);
    createImage(mt1);
  }
  
  setPixel(ImageData imageData, x, y, r, g, b, a) {
    var index = (x + y * imageData.width) * 4;
    imageData.data[index+0] = r;
    imageData.data[index+1] = g;
    imageData.data[index+2] = b;
    imageData.data[index+3] = a;
    
  }
  
  
  
  createImage(var mt1) {
    CanvasRenderingContext2D ctx = init();
    // create a new pixel array
    ImageData imageData = ctx.createImageData(canvas.width, canvas.height);
    
  // draw random dots
  for (var i = 0; i < 100000; i++) {
//    
//    var x = (mt1.genrand_int32() % canvas.width).toInt();
//    var y = (mt1.genrand_int32() % canvas.height).toInt();
//    var r = (mt1.genrand_int32() % 256).toInt();
//    var g = (mt1.genrand_int32() % 256).toInt();
//    var b = (mt1.genrand_int32() % 256).toInt();
    
      var x = (mt1.genrand_real1() * canvas.width).toInt();
      var y = (mt1.genrand_real1() * canvas.height).toInt();
      var r = (mt1.genrand_real1() * 256).toInt();
      var g = (mt1.genrand_real1() * 256).toInt();
      var b = (mt1.genrand_real1() * 256).toInt();
      
    
//    var x = (Math.random() * canvas.width).toInt();
//    var y = (Math.random() * canvas.height).toInt();
//    var r = (Math.random() * 256).toInt();
//    var g = (Math.random() * 256).toInt();
//    var b = (Math.random() * 256).toInt();
    
      setPixel(imageData, x, y, r, g, b, 0xff); // 0xff opaque
      
  }
  
  // copy the image data back onto the canvas
  ctx.putImageData(imageData, 0, 0); // at coords 0,0
    
  }
  
  void graph(mt1) {
    var ctx = init();
    draw(ctx);
  }
  
  draw(var ctx) {
    clear(ctx);
    drawaxes(ctx);
    plotdata(ctx);
  }
  
  clear(var ctx) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
  }
  
  drawaxes(var ctx) {
    ctx.strokeStyle = "black";
    /* y axis along the left edge of the canvas*/
    ctx.beginPath();
    ctx.moveTo(0,0);
    ctx.lineTo(0,canvas.height);
    ctx.stroke();
    /* x axis along the bottom edge of the canvas*/
    ctx.moveTo(0,canvas.height);
    ctx.lineTo(canvas.width,canvas.height);
    ctx.stroke();
  }
  
  plotdata(CanvasRenderingContext2D ctx) {
    ctx.strokeStyle = "black";
    ctx.beginPath();
    
    ctx.moveTo(0,10);
    ctx.lineTo(10,10);
    ctx.stroke();
    
  }
  
  CanvasElement canvas;
  CanvasRenderingContext2D init() {
    canvas = document.query("#canvas");
    var ctx = canvas.getContext("2d");
    return ctx;
  }
  
  void genrand_res53(var mt1) {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_res53()<br>");
    
    for (var i = 0; i<1000; ++i) {
      
      sb.add(uniform_right_0(mt1.genrand_res53(), 10));
      
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
  }
  
  void genrand_real3(var mt1) {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_real3()<br>");
    
    for (var i = 0; i<1000; ++i) {
      
      sb.add(uniform_right_0(mt1.genrand_real3(), 10));
      
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
  }

  
  void genrand_real1(var mt1) {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_real1()<br>");
    
    for (var i = 0; i<1000; ++i) {
      
      sb.add(uniform_right_0(mt1.genrand_real1(), 10));
      
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
    
  }
  
  
  
  void genrand_int31(var mt1) {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_int31()<br>");
    
    for (var i = 0; i<1000; ++i) {
      
      sb.add(uniform_left_sp(mt1.genrand_int31(), 10));
      
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
    
  }
  
  void genrand_real2(var mt1) {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_real2()<br>");
    
    for (var i = 0; i<1000; ++i) {
      num n = mt1.genrand_real2();
      //sb.add(uniform_right_0(n, 10));
      sb.add(n);
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
    
  }
  
  genrand_int32() {
    DivElement d = document.query('#container');
    Element p = new Element.html('<p style="font-family: monospace;">');
    
    StringBuffer sb = new StringBuffer();
    sb.add("1000 outputs of genrand_int32()<br>");
    MersenneTwister19937 mt1 = new MersenneTwister19937();
    
    var l = new List();
    l.add(0x123);
    l.add(0x234);
    l.add(0x345);
    l.add(0x456);
    l.add(0x123);
    l.add(0x234);
    l.add(0x345);
    l.add(0x456);
    l.add(0x123);
    l.add(0x234);
    l.add(0x345);
    l.add(0x456);
    l.add(0x123);
    l.add(0x234);
    l.add(0x345);
    l.add(0x456);
    mt1.init_by_array(l, l.length);
    
    for (var i = 0; i<1000; ++i) {
      num n = mt1.genrand_int32();
      //n.toRadixString(radix)
      //sb.add(uniform_left_sp(n, 10));
      sb.add("0x" + n.toRadixString(16));
      if (i%5==4) {
        sb.add("<br>");
      } else {
        sb.add(" ");
      }
    }
    
    p.innerHTML = sb.toString();
    d.nodes.add(p);
    return mt1;
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new MersenneTwister19937class().run();
}
