import 'package:flutter/material.dart';
import '../models/chess_piece.dart';
import '../theme/app_theme.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});
  @override
  State<ChessBoard> createState() => _ChessBoardState();
}
class _ChessBoardState extends State<ChessBoard> {
  late List<List<ChessPiece?>> _board;
  (int, int)? _selected;
  (int, int)? _lastFrom;
  (int, int)? _lastTo;

  @override
  void initState() { super.initState(); _board = _initialBoard(); }

  List<List<ChessPiece?>> _initialBoard() {
    final board = List.generate(8, (_) => List<ChessPiece?>.filled(8, null));
    const back = [PieceType.rook, PieceType.knight, PieceType.bishop, PieceType.queen, PieceType.king, PieceType.bishop, PieceType.knight, PieceType.rook];
    for (var c = 0; c < 8; c++) {
      board[0][c] = ChessPiece(back[c], PieceColor.black);
      board[1][c] = const ChessPiece(PieceType.pawn, PieceColor.black);
      board[6][c] = const ChessPiece(PieceType.pawn, PieceColor.white);
      board[7][c] = ChessPiece(back[c], PieceColor.white);
    }
    return board;
  }

  void _tapSquare(int row, int col) {
    setState(() {
      final piece = _board[row][col];
      if (_selected == null) { if (piece != null) _selected = (row, col); return; }
      final from = _selected!;
      if (from == (row, col)) { _selected = null; return; }
      final fromPiece = _board[from.$1][from.$2];
      if (piece != null && piece.color == fromPiece?.color) { _selected = (row, col); return; }
      _board[row][col] = fromPiece;
      _board[from.$1][from.$2] = null;
      _lastFrom = from; _lastTo = (row, col); _selected = null;
    });
  }

  @override
  Widget build(BuildContext context) => AspectRatio(aspectRatio: 1, child: Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.purple.withOpacity(.45), width: 2),
      boxShadow: [BoxShadow(color: AppColors.purple.withOpacity(.08), blurRadius: 22, spreadRadius: 2)]),
    child: ClipRRect(borderRadius: BorderRadius.circular(6), child: Column(children: List.generate(8, (row) => Expanded(
      child: Row(children: List.generate(8, (col) {
        final light = (row + col).isEven;
        final selected = _selected == (row, col);
        final isLast = _lastFrom == (row, col) || _lastTo == (row, col);
        final piece = _board[row][col];
        return Expanded(child: GestureDetector(onTap: () => _tapSquare(row, col), child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(color: selected ? const Color(0xFFB8A3FF) : isLast ? (light ? const Color(0xFFE8DCA1) : const Color(0xFF9A8A51)) : (light ? AppColors.boardLight : AppColors.boardDark)),
          child: Stack(children: [
            if (col == 0) Positioned(left: 3, top: 2, child: Text('${8-row}', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: light ? AppColors.boardDark : AppColors.boardLight))),
            if (row == 7) Positioned(right: 3, bottom: 1, child: Text(String.fromCharCode(97+col), style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: light ? AppColors.boardDark : AppColors.boardLight))),
            if (selected) const Center(child: Icon(Icons.circle, size: 13, color: Color(0xFF6B4AC7))),
            if (piece != null) Center(child: AnimatedScale(scale: selected ? 1.12 : 1, duration: const Duration(milliseconds: 130),
              child: Text(piece.symbol, style: TextStyle(fontSize: 32, height: 1, color: piece.color == PieceColor.white ? const Color(0xFFF8F7FF) : const Color(0xFF20202B),
                shadows: [Shadow(color: piece.color == PieceColor.white ? const Color(0xFF3C355A).withOpacity(.65) : Colors.white.withOpacity(.24), blurRadius: 2, offset: const Offset(1, 2))])))),
          ]),
        )));
      })),
    )))),
  ));
}
