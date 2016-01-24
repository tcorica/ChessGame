class Rook extends Piece
{

  Rook(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }


  /**
   * Adds legal move positions to MoveList, searching from present position
   * in the direction of dir.  For example, if dir.x = 0 and dir.y = -1, searches up
   * the board.  Legal moves are to empty squares or captures of opponent pieces.
   * Once another piece is encountered in the search, the search stops.
   */
  private void addMovesInDirection(ArrayList<PVector> Movelist, PVector dir)
  {
    PVector spot = getLocation();
    spot.add(dir);  // go to first location to look
    while (spot.x >= 0 && spot.x <8 && spot.y >=0 && spot.y <8)
    {
      Piece p = b.get((int) spot.x, (int) spot.y); 
      if (p == null) {
        Movelist.add(new PVector(spot.x, spot.y));  // Can move to empty square
        spot.add(dir);  // go to next square in this direction
      } else 
      {
        if (p.getColor() != getColor())
          Movelist.add(spot);  // Can capture opponent piece
        break;  // If finds a non-empty square, stop looking in this direction.
      }
    }  // For loop
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    addMovesInDirection(Movelist, new PVector(0, -1));
    addMovesInDirection(Movelist, new PVector(0, +1));
    addMovesInDirection(Movelist, new PVector(-1, 0));
    addMovesInDirection(Movelist, new PVector(1, 0));
    return Movelist;
  }

  String toString()
  {
    if (myColor==WHITE) {
      return "wR";
    } else {
      return "bR";
    }
  }
}