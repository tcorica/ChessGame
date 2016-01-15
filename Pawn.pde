class Pawn extends Piece
{

  Pawn(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector Basic;
    if (myColor==WHITE) {
      Basic = new PVector(OG.x, OG.y-1);  // ???????????????????????????????????????????????
    } else {
      Basic = new PVector(OG.x, OG.y+1);
    }
    Movelist.add(Basic);
    return Movelist;
  }

  String toString()
  {
    if (myColor == WHITE)
      return "wP"; // temporary code
    else
      return "bP"; // temporary code
  }
}