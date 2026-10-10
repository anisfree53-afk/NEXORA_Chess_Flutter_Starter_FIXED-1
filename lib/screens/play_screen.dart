import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/chess_board.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  void _showInfo(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (context) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Text(
            'Prototype only: legal move validation, game clocks and special rules are not implemented yet.',
            style: TextStyle(height: 1.5, color: AppColors.textMuted),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play chess', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () => _showInfo(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 22),
        children: [
          const _PlayerStrip(name: 'NEXORA Player', rating: '1200', isTop: true),
          const SizedBox(height: 12),
          const ChessBoard(),
          const SizedBox(height: 12),
          const _PlayerStrip(name: 'Local opponent', rating: '—', isTop: false),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF292C3B)),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline_rounded, color: AppColors.purpleLight),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Prototype board: tap a piece, then tap a destination. Moves are not checked against chess rules yet.',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12, height: 1.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Undo will be added with the game-state engine.')),
                  ),
                  icon: const Icon(Icons.undo_rounded),
                  label: const Text('Undo'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reset will be added with the game-state engine.')),
                  ),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Options'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlayerStrip extends StatelessWidget {
  final String name;
  final String rating;
  final bool isTop;

  const _PlayerStrip({required this.name, required this.rating, required this.isTop});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: isTop ? AppColors.purple.withOpacity(.24) : AppColors.surface2,
          child: Icon(
            isTop ? Icons.person_rounded : Icons.smart_toy_outlined,
            size: 19,
            color: isTop ? AppColors.purpleLight : AppColors.textMuted,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w700))),
        Text(rating, style: const TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
