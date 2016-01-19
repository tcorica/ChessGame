public class DrawableBoard extends Board
{
  int topBoard;
  int leftBoard;

  int boardSize;
  int tileSize;
  int numTiles = 8;
  int col;
  int row;

  /**
   * Constructs a board that will be drawn with upper left corner at top, left,
   * a square with dimensions displaySize x displaySize.
   */
   DrawableBoard(int top, int left, int displaySize)
   {
   topBoard = top;
   leftBoard=left;
   boardSize=displaySize;
   
   tileSize =boardSize / numTiles ; 
   //println(boardSize);
   //println(leftBoard);
   }
   
   
  /**
   * Constructs a board with default location (0,0) and 800 x 800.
   */
  public DrawableBoard()
  {
    // Uses default size and location, (0,0) 800 pixels
  }

  /**
   * Returns the number of the row of the board corresponding
   * to the given mouse coordinates, or -1 if the mouse
   * coords are not on the board.
   */
  public int whichRow(int mX, int mY)
  {
    if (mX> leftBoard && mX<leftBoard+boardSize && mY>topBoard && mY<topBoard+boardSize)
    {
      row = ( mY-topBoard) / tileSize;
    }
    //println(row);
    return row; // TO DO
  }

  /**
   * Returns the number of the column of the board corresponding
   * to the given mouse coordinates, or -1 if the mouse
   * coords are not on the board.
   */
  public int whichCol(int mX, int mY)
  {
    if (mX> leftBoard && mX<leftBoard+boardSize && mY>topBoard && mY<topBoard+boardSize)
    {
      col = (mX-leftBoard) / tileSize ;
    }
    //println(col);
    return col;
  }

  /**
   * Draws the board in the current graphics window.
   */
  public void draw()
  {
    fill(0);
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
          text(get(i, j).toString(), (tileSize*i+leftBoard)+.5*tileSize, (tileSize*j+topBoard)+.5*tileSize);
        }

        //line(i*tileSize, topBoard, i*tileSize, boardSize+topBoard);
        // line(leftBoard, i*tileSize, boardSize+leftBoard, i*tileSize);
      }
    }
    drawHighlights();
  }



  private boolean [][] highlightGrid = new boolean[8][8]; // default values are false
  /**
   * Draws an indication of each cell that is highlighted.
   * For example, a thin green circle around the contents of the cell.
   */
  public void drawHighlights()
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

  /**
   * Sets the given cell to have the status true (highlighted)
   * or false (not highlighted).
   */
  public void setHighlight(int c, int r, boolean status)
  {
    if (c >= 0 && r >=0 && r <8 && c <8)
      highlightGrid[c][r]=status;
  }
}