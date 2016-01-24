class DrawableBoard extends Board
{
  int topBoard;
  int leftBoard;

  int boardSize;
  int tileSize;
  int numTiles = 8;
  int col;
  int row;

  PieceCollection pc = new PieceCollection();
  //Piece p;

  DrawableBoard(int top, int left, int displaySize)
  {
    //p = Piece(row,col, true);
    topBoard = top;
    leftBoard=left;
    boardSize=displaySize;

    tileSize =boardSize / numTiles ; 
    //println(boardSize);
    //println(leftBoard);
  }

  DrawableBoard()
  {
    // Uses default size and location, (0,0) 800 pixels
  }

  /*
  Returns the number of the row of the board corresponding
   to the given mouse coordinates, or -1 if the mouse
   coords are not on the board.
   */
  int whichRow(int mX, int mY)
  {
    if (mX> leftBoard && mX<leftBoard+boardSize && mY>topBoard && mY<topBoard+boardSize)
    {
      row = ( mY-topBoard) / tileSize;
    }
    //println(row);
    return row; // TO DO
  }

  /*
  Returns the number of the col of the board corresponding
   to the given mouse coordinates, or -1 if the mouse
   coords are not on the board.
   */
  int whichCol(int mX, int mY)
  {
    if (mX> leftBoard && mX<leftBoard+boardSize && mY>topBoard && mY<topBoard+boardSize)
    {
      col = (mX-leftBoard) / tileSize ;
    }
    //println(col);
    return col;
  }

  // Draws the board in the window.  This is temporary 
  // code so that we can see if the Board class is working.
  // Ultimately, drawing will be outside of this class.
  void draw()
  {
    fill(150);
    rect(leftBoard, topBoard, boardSize, boardSize);
    for (int x=leftBoard; x<boardSize+leftBoard; x=x+(2*tileSize))
    {
      for (int y=topBoard; y<boardSize+topBoard; y=y+(2*tileSize))
      {
        fill(255);  
        rect(x, y, tileSize, tileSize);
      }
    }
    for (int x=(leftBoard+tileSize); x<boardSize+leftBoard; x=x+(2*tileSize))
    {
      for (int y=(topBoard+tileSize); y<boardSize+topBoard; y=y+(2*tileSize))
      {
        fill(255);
        rect(x, y, tileSize, tileSize);
      }
    }

    for (int i = 0; i<8; i++)
    {
      for (int j =0; j<8; j++)
      {
        if (get(i, j) != null )//&& get(i,j) instanceof Pawn)
        { 
          fill(255, 0, 0);
          textSize(26);
          textAlign(CENTER, CENTER);

          //text(get(i, j).toString(), (tileSize*i+leftBoard)+.5*tileSize, (tileSize*j+topBoard)+.5*tileSize);
          //if (get(i, j) instanceof Bishop && get(i, j).getColor() == WHITE)// Test code - pc works for Bishop only!
          {
            //println(get(i, j));
            if (pc.getImage(get(i, j)) !=null)
              image(pc.getImage(get(i, j)), (tileSize*i+leftBoard)+.5*tileSize, (tileSize*j+topBoard)+.5*tileSize);
          }
        }

        //line(i*tileSize, topBoard, i*tileSize, boardSize+topBoard);
        // line(leftBoard, i*tileSize, boardSize+leftBoard, i*tileSize);
      }
      //if (p instanceof Bishop)
      //  if (p.getColor() == Piece.WHITE)
      //    return wBImage;
    }
    drawHighlights();
  }

  boolean [][] highlightGrid = new boolean[8][8]; // default values are false

  void drawHighlights()
  {
    ellipseMode(CENTER);
    noFill();
    stroke(0, 155, 0);
    for (int i = 0; i<8; i++)
    {
      for (int j =0; j<8; j++)
      {
        if (highlightGrid[i][j]==true)
        {
          ellipse((tileSize*i+leftBoard)+.5*tileSize, (tileSize*j+topBoard)+.5*tileSize, tileSize*0.8, tileSize*0.8);
        }
      }
    }
  }




  void setHighlight(int c, int r, boolean status)
  {
    if (c >= 0 && r >=0 && r <8 && c <8)
      highlightGrid[c][r]=status;
  }
}