class King extends Piece
{

  King(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector NW, NE, SW, SE, Up, Left, Right, Down;

    //D1agonal
    NW=new PVector(OG.x-1, OG.y-1);
    NE=new PVector(OG.x+1, OG.y-1);
    SW=new PVector(OG.x-1, OG.y+1);
    SE=new PVector(OG.x+1, OG.y+1);

    //Card1nal
    Up=new PVector(OG.x, OG.y-1);
    Left=new PVector(OG.x-1, OG.y);
    Right=new PVector(OG.x+1, OG.y);
    Down=new PVector(OG.x, OG.y+1);

    //D1agonal Add1ng
    Movelist.add(NW);
    Movelist.add(NE);
    Movelist.add(SW);
    Movelist.add(SE);

    //Card1nal Add1ng
    Movelist.add(Up);
    Movelist.add(Down);
    Movelist.add(Left);
    Movelist.add(Right);
    return Movelist;
  }

  String toString()
  {
    if (myColor==WHITE) {
      return "wK";
    } else {
      return "bK";
    }
  }
}