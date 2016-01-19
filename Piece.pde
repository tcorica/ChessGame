public abstract class Piece
{
  boolean myColor;
  int myRow, myCol;
  final boolean WHITE = true;
  
  /**
   * Constructor
   * 
   * @param c column to locate this piece
   * @param r row to location this piece
   * @param _myColor  WHITE = true, BLACK = false
  
   */
  public Piece(int c, int r, boolean _myColor)
  {
    myColor = _myColor;
    myRow = r;
    myCol = c;
  }

  /**
   * Returns the color of this piece, WHITE = true;
   */
  public boolean getColor()
  {
    return myColor; // temporary code
  }

  // returns x,y representing column, row 
  
  /**
   * Returns a PVector representing the location of this piece
   * PVector.x is the column, .y is the row 
   * @return location of this piece.
   */
  public PVector getLocation()
  {
    return new PVector(myCol,myRow); // temporary code
  }

  /**
   * Sets the location of this piece to c, r
   */
  public void setLocation(int c, int r)
  {
    myRow = r;
    myCol = c;
    
  }

  /**
   * Returns a string representation of this piece.
   */
  public String toString()
  {
    return "Piece"; // Should be overridden by subclasses
  }

  // Returns a list of legal moves of this piece.
  // "Legal" means valid, e.g., doesn't land on 
  // a piece of the same color, etc.
  /**
   * Returns a list of legal moves of this piece.
   * "Legal" means valid, e.g., doesn't land on a piece 
   * of the same color, etc.
   * 
   * @return ArrayList of locations that are legal for this piece to move to.
   */
  public abstract ArrayList<PVector> possibleMoves();
}