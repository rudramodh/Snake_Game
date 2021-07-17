class GamePlay{

  int snakeSize = 1;//initial size of the snake
  int maxLength = 20;// max length of the snake

  //creating array of PVector for snake
  PVector[] snake = new PVector[maxLength];
  
  //creating PVector of speed to input speed
  PVector speed = new PVector();

  int gridSize = 30;
  float width = 600;
  float height = 600;
    
  //width/grid=600/30=20 then use random to get random values from 0-20
  //to avoid decimal values use typcasting or round
  //to fit exactly in the gridcell multiply by 30 and use corner mode instead of center 
  PVector apple = new PVector((int)random(width/gridSize)*gridSize,(int)random(height/gridSize)*gridSize);
  
  boolean playGame = false;
  
  int score=1;
  
  boolean moveX = false;

  
  void drawGrid(){
    for(int i=0;i<cols;i++){ //no. of columns
      for(int j=0;j<rows;j++){ //no. of rows.
      fill(255,255,255);
      rect(i*gridSize,j*gridSize,gridSize,gridSize); //draws a rectangle every 30units in x,y direction
      }
    }
  }
  
  
  void drawApples(){
    ellipseMode(CORNER); // mode to fit inside a cell
    fill(255,0,0);
    ellipse(apple.x,apple.y,gridSize,gridSize);
  }
  
  
  void initialiseSnake(){
    //PVector[] snake = new PVector[maxLength]; // PVector array of snake
    //PVector a = new PVector(5,0); // creating a new PVector object to assign value PVector array
      snake[0] = new PVector(0,0); //head of the snake, it will always be 1st element
  }

  
  void drawSnake(){
   for (int i=0;i<snakeSize;i++){ //Why snakeSize? As it will increase the size once the apples are eaten.
      fill(56,168,50);
           rect(snake[i].x,snake[i].y,gridSize,gridSize); // draw snake
    } 
  }

  void snakeInput(){
    //Input speed of the snake.
  if (keyPressed == true){
    //Logic behind boolean is, the initial condition is false so whenever you press a or d it becomes true and cannot reverse coz of the condition.

     if (keyCode==UP || key == 'w' && moveX==true){
       speed.x=0;
       speed.y=-gridSize;//Why gridSize? as it moves every 30 units to fit in every grid cell
       moveX=false;
    }
    
    else if (keyCode==DOWN || key =='s' && moveX==true){
      speed.x=0;
      speed.y=gridSize;
      moveX=false;
      
    }
  
    else if (keyCode==LEFT || key=='a' && moveX==false){
      speed.x=-gridSize;
      speed.y=0;
      moveX=true; 
    }
    
    else if (keyCode==RIGHT || key =='d' && moveX==false){
      speed.x=gridSize;
      speed.y=0;
      moveX=true; 
    }
   }
  }
  
  void snakeMove(){
    
     //Movement of the body
     followHead();
     
     //Movement of head only
     snake[0].x = snake[0].x + speed.x;
     snake[0].y = snake[0].y + speed.y; 

  }
  
  void increaseSpeed(){
    if (snakeSize>3){
      frameCount = 3;
    }
    if (snakeSize>6){
      frameCount = 5;
    }
    if (snakeSize>9){
      frameCount = 7;
    }
    if (snakeSize>12){
      frameCount = 8;
    }
  }
  
  void checkApples(){
    if(snake[0].x == apple.x && snake[0].y == apple.y){
      for (int i=0;i<snakeSize;i++){
      if(apple.x == snake[i].x && apple.y == snake[i].y){ // to avaoid overlapping of apples and snake.
        apple.x = (int)random(width/gridSize)*gridSize;
        apple.y = (int)random(width/gridSize)*gridSize;
      }
      else{
        apple.x = (int)random(width/gridSize)*gridSize;
        apple.y = (int)random(width/gridSize)*gridSize;
      }
      }
      
      score++;
      snakeSize++; // increasing the size of the snake as it eats apples
      snakeGrow(); // growing the snake
      
    }
  }
  
    void snakeGrow(){
      
      //for(int i=snakeSize-1;i>0;i--){ // why snakeSize-1? after incrementing the snakeSize in checkApples snakeSize becomes 2 so snakeSize(2)-1 =1 i.e. snake[1] = snake[0].x,snake[0].y, it will create a body at that position.
      
      if(snakeSize >= maxLength-1){
        gameCompleted();
      }
      else {
      snake[snakeSize-1] = new PVector(snake[(snakeSize-1)-1].x, snake[(snakeSize-1)-1].y);// creating the snake at (snakeSize-2) position
      //}
      }
  }
  
  void followHead(){ //movement of body
    
    //I cannot use the below for loop coz, for eg: snake[1].x = snake[2].x which will give NullPointerException as we don't have values for snake[2].x
    //for (int i=1;i<snakeSize;i++){
    //  //updating the head?????
    //  snake[i].x = snake[i+1].x;
    //  snake[i].y = snake[i+1].y;
    for (int i=snakeSize-1;i>0;i--){
      snake[i].x = snake[i-1].x;
      snake[i].y = snake[i-1].y; 
    }
  }
  
  void checkBoundary(){
     if(snake[0].x>width || snake[0].x<0 || snake[0].y>height || snake[0].y<0){ //if head hits the wall then game over
       playGame = false;
       speed.x=0;
       speed.y=0;
       gameOver();
       
     }
  }
  
  void checkDead(){// If the snake head hits its own body then Game Over
       if(snakeSize>3){
       for(int i=2;i<snakeSize-1;i++){ 
         if(snake[0].x == snake[i].x && snake[0].y == snake[i].y){
           speed.x=0;
           speed.y=0;
           gameOver();
         }
       }
     }
  }
  
  void gameOver(){
    background(255);
    fill(0);
    rect(0,0,width,height);

    int textsize = 30;
    textSize(textsize);
    fill(255);
    text("Score: " + score, width-200, 50);
    
    int textsize1 = 50;
    textSize(textsize1);
    fill(255);
    text("Game Over!!", 150, height/2);
    
    int textsize2 = 20;
    textSize(textsize2);
    fill(255);
    text ("click to play again", width/3, height/2+30);
  }
  
  void gameCompleted(){
    background(255);
    fill(0);
    rect(0,0,width,height);
    
    int textsize = 30;
    textSize(textsize);
    fill(255);
    text("Score: " + score, width-200, 50);
    
    int textsize1 = 50;
    textSize(textsize1);
    fill(255);
    text("You Finished the Game!!", 10, height/2);
  }
  
  void reset(){
      if (mousePressed) {
      snake[0] = new PVector(0,0);
      moveX=false;
      score = 1;
      snakeSize=1;
      PVector apple = new PVector((int)random(width/gridSize)*30,(int)random(height/gridSize)*30);
      playGame=true;
      
    }
  }
}
