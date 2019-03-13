import java.math.BigInteger;

PImage img;

void setup(){
  
  size(300,300);


  BigInteger number = new BigInteger("123456789");
  //This number refers to a very compressed cat picture
  //number = new BigInteger("159535709476374841650731866090006827330784352422913699630388262805992974596581511485148012478107689902341491570905206039860635341973645691225374134337226811215765082077749411626576414460868337048616684987033695929614724560498171137948622880305197638928021835632277958062017882089502210985957535090976930622051151852342443439681542302347496412924703920442795149868731424234237103404671748588872312544960067334176624809218138783809547724328394512845806726716190873347663849414285921152403880483635286832297703850644831280193677680455502738937236528620193542160363495018660174863548710815287034746391062158851919557483983486400194402893090141431451877383992364740351130464157351585567348680316631387791708570525964512253620798");
  //To see the correct picture uncomment line 35/36
  
  while(number.toString(2).length() % 8 != 0
  || number.toString(2).length() % 3 != 0){
    number = number.multiply(BigInteger.valueOf(2));
    println(number);
  }
  
  byte[] bytes = number.toByteArray();
  println(bytes.length + " bytes");
  color[] madePixels = new color[(bytes.length - 1) / 3];
  println("madepixels length: " + madePixels.length);
  
  int width = 2;
  int height = madePixels.length/width;
  
  while(madePixels.length % width != 0
  && width <= madePixels.length){
    width++;
  }
  height = madePixels.length / width;
  
  //width = 10;
  //height = 10;
  
  img = createImage(width, height, RGB);
  
  int j = 1;
  for(int i = 0; i < madePixels.length; i++){
  
    color c = color(bytes[j] < 0 ? 255 + bytes[j] : bytes[j], bytes[j+1]< 0 ? 255 + bytes[j +1] : bytes[j + 1], bytes[j+2] < 0 ? 255 + bytes[j + 2] : bytes[j + 2]);
    println("r: " + bytes[j]);
    println("r: " + red(c) + " b: " + blue(c) + " g: " + green(c));
    madePixels[i] = c;
    j += 3;
  }  
  img.pixels = madePixels;
}

void draw(){
  image(img, 0,0,300,300);
}
