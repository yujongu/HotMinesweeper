PlayMode game;
float hotness;
void setup() {
  size(700, 700);
  hotness = 100; //increase for hotter
  game = new PlayMode();
}

void draw() {
  background(0);
  game.genBoard();
  //fill(255, 0, 0, hotness);
  //ellipse(mouseX, mouseY, 40, 40);
}

void mouseReleased() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) 
  {
    //gameStart

    /*
    -2 = undiscovered;
     -1 = flag;
     0 = check;
     9 = mine;
     */


    if (mouseButton == RIGHT) //flagging
    { 
      game.flagBox((int) mouseX / game.size, (int) mouseY / game.size);
    }
    else if (mouseButton == LEFT) //check for mine
    { 
      if (game.startGame == 0) //prevents the first move to be the mine 
      {
        game.startGame = 1;
        println("Start Game");
        game.genMines((int) mouseX / game.size, (int) mouseY / game.size);
      }
      game.checkBox((int) mouseX / game.size, (int) mouseY / game.size);
    }
  }
}
