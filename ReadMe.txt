
Overview:
This is the classic 2D snake game created using JAVA and OOP concept,
where the user is snake and your goal is to move around and eat pieces of food (in our case, apples). 
To start the game the user can press “right arrow key” or “d” to start moving in that direction. 
The user can play by using arrow keys or ‘w’ ‘a’ ‘s’ ‘d’ key. Each time the snake eats the food (apples) it grows. 
You lose the game if the snake runs into itself or the borders of the game area. 
As you consume more apples, the snake's speed increases, making it difficult for the user to complete the game.



Classes: 
I have two classes:
1: Main Class: this is where I instantiated new object of GamePlay class to access all the functions.
2: GamePlay Class: this is where all the functions are created which are listed below.

Functions:
drawGrid(); //draws grid/layout
drawSnake(); //draws snake
drawApples(); //draws apple
snakeInput(); //inputting the speed
snakeMove(); //responsible for moving the head and body of the snake
increaseSpeed(); //to increase the speed
checkApples(); //checks if the snake eats the apple and increments the snakeSize as well as grows the snake at that position.
checkDead(); // checks if the snake hits itself, if yes then game over
checkBoundary();// checks if the snake hits the wall/borders, if yes then game over
reset(); // once the game is over the user has an option to play again by clicking on the screen
