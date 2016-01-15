abstract class Piece
{
  boolean myColor;
  int myRow, myCol;
  final boolean WHITE = true;
  
  
  // White = true, black = false
  Piece(int c, int r, boolean _myColor)
  {
    myColor = _myColor;
    myRow = r;
    myCol = c;
  }

  // return color of this piece, White = true;
  boolean getColor()
  {
    return myColor; // temporary code
  }

  // returns x,y representing column, row 
  PVector getLocation()
  {
    return new PVector(myCol,myRow); // temporary code
  }

  void setLocation(int c, int r)
  {
    myRow = r;
    myCol = c;
    
  }




  String toString()
  {
    return "Piece"; // Should be overridden by subclasses
  }

  // Returns a list of legal moves of this piece.
  // "Legal" means valid, e.g., doesn't land on 
  // a piece of the same color, etc.
  abstract ArrayList<PVector> possibleMoves();
}