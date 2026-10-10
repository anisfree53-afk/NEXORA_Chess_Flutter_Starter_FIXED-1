enum PieceColor { white, black }
enum PieceType { king, queen, rook, bishop, knight, pawn }

class ChessPiece {
  final PieceType type;
  final PieceColor color;
  const ChessPiece(this.type, this.color);

  String get symbol {
    const white = {PieceType.king:'♔', PieceType.queen:'♕', PieceType.rook:'♖', PieceType.bishop:'♗', PieceType.knight:'♘', PieceType.pawn:'♙'};
    const black = {PieceType.king:'♚', PieceType.queen:'♛', PieceType.rook:'♜', PieceType.bishop:'♝', PieceType.knight:'♞', PieceType.pawn:'♟'};
    return (color == PieceColor.white ? white : black)[type]!;
  }
}