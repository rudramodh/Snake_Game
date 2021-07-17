
//Instantiating new object of GamePlay
GamePlay gameplay = new GamePlay();
float cols;
float rows;
float gridSize;


void setup(){
// Size of each cell in the grid, ratio of window size to video size
// 20 * 30 = 600
// 20 * 30 = 600
  cols= 20;
  rows= 20;
  gridSize= 30;

  
  size(600,600);
  //The call to frameRate() should be in the setup() part of your code, not draw(), since you only need to set the frame rate once.
  //The number you put between the parentheses determines how many times per second the code in draw() gets run
  //frameRate(10);
  
  gameplay.initialiseSnake();
  
  }

void draw(){
      stroke(0);
      strokeWeight(2);
  
      gameplay.drawGrid();//draws grid
      gameplay.drawSnake();//draws snake
      gameplay.drawApples();//draws apple
      gameplay.snakeInput();//inputting the speed
      //The number of frames that have been displayed since the program started
      //it moves and resets it to original speed every n frames
      if(frameCount%10 == 0){
          gameplay.snakeMove();//responsible for moving the head and body of the snake
          gameplay.increaseSpeed(); //to increase the speed
        }
      gameplay.checkApples();//checks if the snake eats the apple and increments the snakeSize as well as grows the snake at that position.
      gameplay.checkDead();// checks if the snake hits itself, if yes then game over
      gameplay.checkBoundary();// checks if the snake hits the wall, if yes then game over
      gameplay.reset();// resets everything.
  }
      
