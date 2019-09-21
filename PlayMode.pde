class PlayMode {
  //  Beginner – 9 * 9 Board and 10 Mines
  //  Intermediate – 16 * 16 Board and 40 Mines
  //  Advanced – 24 * 24 Board and 99 Mines
  int diff = 16;
  int mineCount = 40;

  int[][] board = new int[diff][diff];
  int startGame = 0;
  int[][] numBoard = new int[diff][diff];
  int size;

  PlayMode() {
    size = width / board.length;
    for (int i = 0; i < diff; i++) {
      for (int j = 0; j < diff; j++) {
        board[i][j] = -2;
        numBoard[i][j] = 0;
      }
    }
    /*
    -2 = undiscovered;
     -1 = flagged;
     0 = clear;
     9 = mine;
     */
  }

  void genMines(int initXPos, int initYPos) {
    for (int i = 0; i < mineCount; i++) {
      int xPos = (int) random(0, diff);
      int yPos = (int) random(0, diff);
      
      // no mine within 3 x 3 on the first click
      while ((xPos > initXPos - 2 && xPos < initXPos + 2 && yPos > initYPos - 2 && yPos < initYPos + 2) || numBoard[xPos][yPos] == 9) {
        xPos = (int) random(0, diff);
        yPos = (int) random(0, diff);
      }
      numBoard[xPos][yPos] = 9;
    }
    fillNumBoard();
  }

  void fillNumBoard() {
    for (int i = 0; i < diff; i++) {
      for (int j = 0; j < diff; j++) {
        if (numBoard[i][j] != 9) {
          int nums = 0;
          //lefttop
          if (i - 1 >= 0 && j - 1 >= 0 && numBoard[i - 1][j - 1] == 9) {
            nums++;
          }
          //top
          if (j - 1 >= 0 && numBoard[i][j - 1] == 9) {
            nums++;
          }
          //righttop
          if (i + 1 < diff && j - 1 >= 0 && numBoard[i + 1][j - 1] == 9) {
            nums++;
          }
          //left
          if (i - 1 >= 0 && numBoard[i - 1][j] == 9) {
            nums++;
          }
          //right
          if (i + 1 < diff && numBoard[i + 1][j] == 9) {
            nums++;
          }
          //leftbot
          if (i - 1 >= 0 && j + 1 < diff && numBoard[i - 1][j + 1] == 9) {
            nums++;
          }
          //bot
          if (j + 1 < diff && numBoard[i][j + 1] == 9) {
            nums++;
          }
          //rightbot
          if (i + 1 < diff && j + 1 < diff && numBoard[i + 1][j + 1] == 9) {
            nums++;
          }
          numBoard[i][j] = nums;
        } else {
        }
      }
    }
  }

  void printNumBoard() {
    for (int i = 0; i < diff; i++) {
      for (int j = 0; j < diff; j++) {
        print(board[i][j] + " ");
      }
      println();
    }
  }

  void genBoard() {
    stroke(255);
    noFill();
    int size = width / board.length;
    for (int i = 0; i < diff; i++) {
      for (int j = 0; j < diff; j++) {
        if (board[i][j] == -2) {
          fill(0);
          rect(i * size, j * size, size, size);
        } else if (board[i][j] == -1) {
          fill(255, 165, 0);
          rect(i * size, j * size, size, size);
        } else if (board[i][j] == 0) {
          fill(255);
          rect(i * size, j * size, size, size);
        } else if (board[i][j] == 9) {
          fill(255, 0, 0);
          rect(i * size, j * size, size, size);
          println("GameOver");
        } else {
          fill(100);
          rect(i * size, j * size, size, size);
          fill(255);
          text(board[i][j], i * size + size / 3, j * size + size / 2);
        }
      }
    }
  }

  void checkBox(int xPos, int yPos) {
    if (numBoard[xPos][yPos] == 0) {
      board[xPos][yPos] = 0;

      //lefttop
      if (xPos - 1 >= 0 && yPos - 1 >= 0  && board[xPos - 1][yPos - 1] == -2) {
        checkBox(xPos - 1, yPos - 1);
      }
      //top
      if (yPos - 1 >= 0  && board[xPos][yPos - 1] == -2) {
        checkBox(xPos, yPos - 1);
      }
      //righttop
      if (xPos + 1 < diff && yPos - 1 >= 0  && board[xPos + 1][yPos - 1] == -2) {
        checkBox(xPos + 1, yPos - 1);
      }
      //left
      if (xPos - 1 >= 0  && board[xPos - 1][yPos] == -2) {
        checkBox(xPos - 1, yPos);
      }
      //right
      if (xPos + 1 < diff  && board[xPos + 1][yPos] == -2) {
        checkBox(xPos + 1, yPos);
      }
      //leftbot
      if (xPos - 1 >= 0 && yPos + 1 < diff  && board[xPos - 1][yPos + 1] == -2) {
        checkBox(xPos - 1, yPos + 1);
      }
      //bot
      if (yPos + 1 < diff  && board[xPos][yPos + 1] == -2) {
        checkBox(xPos, yPos + 1);
      }
      //rightbot
      if (xPos + 1 < diff && yPos + 1 < diff  && board[xPos + 1][yPos + 1] == -2) {
        checkBox(xPos + 1, yPos + 1);
      }
    } else {
      board[xPos][yPos] = numBoard[xPos][yPos];
    }
  }


  void flagBox(int xPos, int yPos) {
    if(board[xPos][yPos] != -1 && board[xPos][yPos] == -2){
      board[xPos][yPos] = -1;
    } else if(board[xPos][yPos] == -1){
      board[xPos][yPos] = -2;
    }
  }
}
