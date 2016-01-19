class Board
{
  final boolean WHITE = true;


  // [col][row] where black's back row is row=0 and white's back row is row=7
  //  
  private Piece [][] grid = new Piece[8][8];

  // Creates a starting board setup (with all pieces in 
  // their starting positions.

  Board()
  {
    init();
  }


/**
* Places all pieces onto to the board in their correct starting positions, 
* with White in rows 6 and 7, and black in rows 0 and 1.
*/
  void init()
  {
    for (int i =0; i <8; i++)
    {
      grid[i][1]= new Pawn (i, 1, !WHITE);
      grid[i][6]=new Pawn (i, 6, WHITE);
    }
    grid[1][0]=new Knight (1, 0, !WHITE);
    grid[6][0]=new Knight (6, 0, !WHITE); 
    grid[1][7]=new Knight (1, 7, WHITE);
    grid[6][7]=new Knight (6, 7, WHITE);

    grid[2][0]=new Bishop (2, 0, !WHITE);
    grid[5][0]=new Bishop(5, 0, !WHITE);
    grid[2][7]=new Bishop (2, 7, WHITE);
    grid[5][7]=new Bishop(5, 7, WHITE);

    grid[0][0]=new Rook (0, 0, !WHITE);
    grid[7][0]=new Rook (7, 0, !WHITE);
    grid[0][7]=new Rook (0, 7, WHITE);
    grid[7][7]=new Rook (7, 7, WHITE);

    grid[3][0]=new Queen (3, 0, !WHITE);
    grid[4][0]=new King (4, 0, !WHITE);
    grid[3][7]=new Queen (3, 7, WHITE);
    grid[4][7]=new King (4, 7, WHITE);
  }

  /**
  * Returns the piece at the given location on the board.
  * If the square is empty, returns null.
  * Assumes r and c are in range 0..7
  */
  Piece get(int c, int r)
  {
    return grid[c][r];
  }


  /**
  * Moves the piece at location (x,y) to location (x2, y2)
  * Assumes that this is a legal move.
  */
  void move(int x, int y, int x2, int y2)
  {
    Piece p = grid[x][y];
    grid[x][y]= null;
    grid[x2][y2]=p;
    p.setLocation(x2,y2); 
  }
}