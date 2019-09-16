class Board {
  //  Beginner – 9 * 9 Board and 10 Mines
  //  Intermediate – 16 * 16 Board and 40 Mines
  //  Advanced – 24 * 24 Board and 99 Mines
  
  int[][] board = new int[9][9];

  Board() {
  }


  void genBoard() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        rect(i, j, 10, 10);
      }
    }
  }
}
