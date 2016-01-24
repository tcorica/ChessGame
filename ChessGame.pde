/*
Chess!
 
 Major changes:
 Addition of DrawableBoard class
 
 Max, Amy: Complete constructors and new methods at top of DrawableBoard.  
 Then improve the look of the board.
 
 Nick, Anthony:  Devise a "top-level" design for the game screen.  The board need not fill 
 the entire window.  Are there buttons needed?  Sequence of game screens?  Indicator
 of whose turn it is?  Code what you can, and design clearly what you cannot.
 
 Trevor, Dan: Complete rest of pieces; then work on possibleMoves() for each
 
 
 */
boolean pieceSelected = false;
boolean currPlayer = true;
Piece toMove = null;
boolean onList = false;

DrawableBoard b;

void setup()
{
  size(1000, 800);
  background(0);
  b = new DrawableBoard(200, 300, 400);
}
void draw()
{
  background(200, 0, 0);
  b.draw();
  textSize(50);
  fill(255);
  if (currPlayer==true) {
    text("White's Turn", 500, 50);
  } else {
    fill(0);
    text("Black's Turn", 500, 50);
  }
}


void mouseClicked()
{
  int row = b.whichRow(mouseX, mouseY);
  int c = b.whichCol(mouseX, mouseY);

  if (pieceSelected==false)
  {
    toMove = b.get(c, row);
    if (toMove != null && toMove.getColor() == currPlayer) {  // Must also check if it's a piece of the plaer whose turn it is.
      clearHighlights();
      pieceSelected=true;
      ArrayList<PVector> moves = toMove.possibleMoves();
      for (PVector p : moves)
      {
        b.setHighlight((int)p.x, (int)p.y, true);
      }
    }
  } else
  {
    Piece r = b.get(c, row);
    if ( (r == null || r.getColor() != toMove.getColor() ) && onList(toMove.possibleMoves(), c, row)) {
      clearHighlights();
      b.move(
        (int)toMove.getLocation().x, 
        (int)toMove.getLocation().y, 
        c, 
        row);
      pieceSelected = false;
      currPlayer = !currPlayer;
    } else if (r != null && r.getColor() == toMove.getColor()) {
      clearHighlights();
      toMove=b.get(c, row);
      ArrayList<PVector> moves = toMove.possibleMoves();
      for (PVector p : moves)
      {
        b.setHighlight((int)p.x, (int)p.y, true);
      }
    }
  }
}

boolean onList(ArrayList<PVector> list, int col, int row)
{
  for (PVector p : list)
  {
    if ((int) p.x == col && (int) p.y == row)
      return true;
  }
  return false;
}

// possible add to drawble board?VVV
void clearHighlights()
{
  for (int i = 0; i<8; i++)
  {
    for (int j =0; j<8; j++)
    {
      b.setHighlight(i, j, false);
    }
  }
}