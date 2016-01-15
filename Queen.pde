class Queen extends Piece
{

  Queen(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> Movelist= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector NW, NE, SW, SE, Up, Left, Right, Down;
    for (int i=0; i<8; i++) {
      
      //Diagonal
      NW=new PVector(OG.x-i, OG.y-i);
      NE=new PVector(OG.x+i, OG.y-i);
      SW=new PVector(OG.x-i, OG.y+i);
      SE=new PVector(OG.x+i, OG.y+i);
      
      //Cardinal
      Up=new PVector(OG.x, OG.y-i);
      Left=new PVector(OG.x-i, OG.y);
      Right=new PVector(OG.x+i, OG.y);
      Down=new PVector(OG.x, OG.y+i);
      
      //Diagonal Adding
      Movelist.add(NW);
      Movelist.add(NE);
      Movelist.add(SW);
      Movelist.add(SE);
      
      //Cardinal Adding
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
      return "wQ";
    } else {
      return "bQ";
    }
  }
}