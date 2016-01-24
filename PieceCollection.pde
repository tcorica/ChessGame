class PieceCollection {


  PImage piecesImage;
  HashMap <String, PImage> m = new HashMap <String, PImage>();
  //PImage bPImage;
  //PImage wNImage;
  //PImage bNImage;
  //PImage wBImage;
  //PImage bBImage;
  //PImage wKImage;
  //PImage bKImage;
  //PImage wRImage;
  //PImage bRImage;
  //PImage wQImage;
  //PImage bQImage;

  PieceCollection()
  {
    imageMode(CENTER);
    PImage piecesImage=loadImage("Chess_Pieces_Sprite.svg_1.png");
    piecesImage.resize(400, 100);
    m.put("wB", piecesImage.get(140, 0, 50, 50));
    m.put("bB", piecesImage.get(140, 50, 50, 50));
    m.put("wP", piecesImage.get(340, 0, 50, 50));
    m.put("bP", piecesImage.get(340, 50, 50, 50));
    m.put("wN", piecesImage.get(208, 0, 50, 50));
    m.put("bN", piecesImage.get(208, 50, 50, 50));
    m.put("wQ", piecesImage.get(75, 0, 50, 50));
    m.put("bQ", piecesImage.get(75, 50, 50, 50));
    m.put("wK", piecesImage.get(5, 0, 50, 50));
    m.put("bK", piecesImage.get(5, 50, 50, 50));
    m.put("wR", piecesImage.get(275, 0, 50, 50));
    m.put("bR", piecesImage.get(275, 50, 50, 50));

    //wBImage = piecesImage.get(140, 0, 50, 50);
    //bBImage = piecesImage.get(140,50,50,50);
    //bBImage = piecesImage.get(140, 50, 50, 50);
  }

  PImage getImage(Piece p)
  {
    return m.get(p.toString());
  }
}


//PImage getImage(Piece p)
//{
//  if (p.toString().equals("bB"))
//    return bBImage;
//  return null;
//}