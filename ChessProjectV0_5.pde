/*
Chess!
 
 Max: add a facility to display the board in different orientations, e.g., 90 degree rotations
 Amy: Add graphical pieces
 
  Nick, Anthony:  Essential game play sequence: click, highlight, click, move
 
 Trevor, Dan: Complete possible moves for each piece
 [Note:  King is pretty tough because of castling!]
 
 Daniel:  Save a snapshot of the game, so that it can be loaded later and continued.
 Mary: Work with Dan on this?
  
 */

DrawableBoard b;

void setup()
{
  size(1000, 800);
  background(0);
  b = new DrawableBoard(100, 200, 400);
//  b.move(6, 7, 5, 5);
}

void draw()
{
  background(200, 0, 0);
  b.draw();
}

void clearHighlights()
{
  for (int i=0; i< 8; i++)
    for (int j=0; j< 8; j++)
      b.setHighlight(i, j, false);
}



void mouseClicked()
{
  testPossibleMove();
}


// Highlights possibleMoves() for piece at current position 
// of mouse.
void testPossibleMove()
{
  clearHighlights();
  
  // Checking where a piece can move
  int r = b.whichRow(mouseX, mouseY);
  int c = b.whichCol(mouseX, mouseY);

  Piece theP = b.get(c, r);
  if (theP != null)
  {
    ArrayList<PVector> moves = theP.possibleMoves();
    for (PVector m : moves)
    {
      b.setHighlight((int)m.x, (int)m.y, true);  
      //println(p);
    }
  }
}

//========================================================
//========================================================

// Below is some sample code as the beginning of code to 
// execute a move based on a string given in chess notation.
void makeMove(String move)
{
  move = "d5";
  int moveCol = 4;
  int moveRow = 5;

  int startCol = -1;
  int startRow = -1;
  for (int r = 0; r < 8; r++)
  {
    for (int c = 0; c < 8; c++)
    {
      Piece p = b.get(c, r);
      ArrayList<PVector> moveList = p.possibleMoves();
      for (PVector m : moveList)
      {
        if (m.x == moveCol && m.y == moveRow)
        {
          startCol = c;
          startRow = r;
        }
      }
    }
    if (startCol != -1)
      b.move(startCol, startRow, moveCol, moveRow);
    //else
    // didn't find a source!
  }
}
// End of execute move sample code