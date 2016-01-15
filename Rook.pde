class Rook extends Piece
{

  Rook(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector Up, Left, Right, Down;
    for (int i=1; i<8; i++) {
      Up=new PVector(OG.x, OG.y-i);
      Left=new PVector(OG.x-i, OG.y);
      Right=new PVector(OG.x+i, OG.y);
      Down=new PVector(OG.x, OG.y+i);
      Movelist.add(Up);
      Movelist.add(Down);
      Movelist.add(Left);
      Movelist.add(Right);
    }
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