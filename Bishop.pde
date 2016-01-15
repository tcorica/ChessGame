class Bishop extends Piece
{

  Bishop(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector NW, NE, SW, SE;
    for (int i=0; i<8; i++){
      NW=new PVector(OG.x-i, OG.y-i);
      NE=new PVector(OG.x+i, OG.y-i);
      SW=new PVector(OG.x-i, OG.y+i);
      SE=new PVector(OG.x+i, OG.y+i);
      Movelist.add(NW);
      Movelist.add(NE);
      Movelist.add(SW);
      Movelist.add(SE);
    }
    return Movelist;
  }

  String toString()
  {
    if (myColor==WHITE) {
      return "wB";
    } else {
      return "bB";
    }
  }
}