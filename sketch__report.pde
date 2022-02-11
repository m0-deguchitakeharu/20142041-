float baseH = 20;

float arm1W = 15;
float arm1D = 15;
float arm1L = 20;

float arm2W = 8;
float arm2D = 8;
float arm2L = 30;

float arm3W = 5;
float arm3D = 5;
float arm3L = 30;

float armW1 = 10;
float armW2 = 10;
float armW3 = 5;

float angle1 = 0;
float angle2 = 0;
float angle3 = 0;

float dif = 0.5;

float cameraX = 100;
float cameraY = 100;

float sx=random(10,50);
float sy=random(-50,50);
float sz=random(10,20);

void setup(){
  size(800, 700, P3D);
  
  noStroke();  
}

void draw(){
  
    camera(cameraX, cameraY, 150, 0, 0, 0, 0, 0, -1);
  
  background(255);
  
  if(keyPressed){
    if(key == 'o'){
      angle1 = angle1 + dif;
    }
    if(key == 'O'){
      angle1 = angle1 - dif;
    }
    if(key == 'b'){
      angle2 = angle2 + dif;
    }
    if(key == 'B'){
      angle2 = angle2 - dif;
    }
    if(key == 'g'){
      angle3 = angle3 + dif;
    }
    if(key == 'G'){
      angle3 = angle3 - dif;
    }
    if(key == 'R'){
      angle1 = 0;
      angle2 = 0;
      angle3 = 0;
      sx=random(10,50);
      sy=random(-50,50);
      sz=random(10,20);
      cameraX = 100;
      cameraY = 100;
    }
    if(key == 'l'){
      cameraX += 10;
    }
     if(key == 'L'){
      cameraX -= 10;
    }
    if(key == 'k'){
      cameraY += 10;
    }
     if(key == 'K'){
      cameraY -= 10;
    }
  }

float theta1 = radians(angle1);
float theta2 = radians(angle2);
float theta3 = radians(angle3);

float px=(arm2L*cos(theta1)*sin(theta2))+((arm3L+10)*(cos(theta1)*(sin(theta2+theta3))));
float py=(arm2L*sin(theta1)*sin(theta2))+((arm3L+10)*(sin(theta1)*sin(theta2+theta3)));
float pz=(baseH+(arm1L/2))+cos(theta2)*arm2L+cos(theta2+theta3)*(arm3L+10);

  pushMatrix();
  
  //base
  rotateZ(theta1);
  translate(0,0,baseH/2);
  fill(150);
  stroke(10);
  box(10,10,baseH);
  
  //1st link
  translate(0,0,baseH/2+arm1L/2);
  fill(50);
  noStroke();
  box(arm1W,arm1D,arm1L);
  
  //2nd link
  //go to 2nd joint
  translate(0,0,0);
  rotateY(theta2);  
  //go to center of 2nd joint
  translate(0,0,arm2L/2);
  fill(150);
  stroke(10);
  box(arm2W,arm2D,arm2L);
  
  //3rd link
  // go to 3rd joint
  translate(0, 0, arm2L/2);
  rotateY(theta3);
  // go to center of 3rd joint
  translate(0, 0, arm3L/2);
  fill(150);
  stroke(10);
  box(arm3W,arm3D,arm3L);

  translate(0, 0, arm3L/2);  
  fill(30);
  lights();
  box(0.3,0.3,10);
  
  translate(px,py,pz-(baseH+arm1L/2+arm2L+arm3L));
  noFill();
  noStroke();
  sphere(1);

popMatrix();

translate(0,0,-0.2);
fill(200);
stroke(10);
noLights();
box(200,200,0.4);

translate(sx,sy,sz);
 fill(255,0,0);
  if( sq(sx-px)+sq(sy-py)+sq(sz-pz) <= sq(1+10) ){
  noFill(); }
  noStroke();
  lights();
sphere(10);


}
