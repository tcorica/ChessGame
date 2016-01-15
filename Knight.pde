class Knight extends Piece
{

  Knight(int r, int c, boolean myColor)
  {
    super(r, c, myColor);
  }

  ArrayList<PVector> possibleMoves()
  {
    ArrayList<PVector> MoveList= new ArrayList<PVector>();
    PVector OG= getLocation();
    PVector NNW, NWW, NNE, NEE, SSW, SWW, SSE, SEE;

    MoveList.add(new PVector(OG.x-1, OG.y-2));
    MoveList.add(new PVector(OG.x-2, OG.y-1));
    MoveList.add(new PVector(OG.x+1, OG.y-2));
    MoveList.add(new PVector(OG.x+2, OG.y-1));
    MoveList.add(new PVector(OG.x-1, OG.y+2));
    MoveList.add(new PVector(OG.x-2, OG.y+1));
    MoveList.add(new PVector(OG.x+2, OG.y+1));
    MoveList.add(new PVector(OG.x+1, OG.y+2));
    
    return MoveList;
  }

  String toString()
  {
    if (myColor == WHITE)
      return "wN"; // temporary code
    else
      return "bN"; // temporary code
  }
}