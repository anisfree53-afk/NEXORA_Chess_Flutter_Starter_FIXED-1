import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_mark.dart';
import 'play_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _pages = const [_DashboardTab(), PlayScreen(), ProfileScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: IndexedStack(index: _index, children: _pages)),
    bottomNavigationBar: NavigationBar(
      selectedIndex: _index, onDestinationSelected: (v) => setState(() => _index = v),
      backgroundColor: AppColors.surface, indicatorColor: AppColors.purple.withOpacity(.22),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.sports_esports_rounded), label: 'Play'),
        NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        NavigationDestination(icon: Icon(Icons.tune_rounded), label: 'Settings'),
      ],
    ),
  );
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(20, 18, 20, 24), children: [
    Row(children: [
      const BrandMark(size: 44), const SizedBox(width: 12),
      const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('NEXORA', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2.2, fontSize: 16)),
        SizedBox(height: 3), Text('CHESS CLUB', style: TextStyle(color: AppColors.textMuted, fontSize: 9, letterSpacing: 2)),
      ])),
      IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsScreen())), icon: const Icon(Icons.notifications_none_rounded)),
    ]),
    const SizedBox(height: 30),
    const Text('Ready for your next move?', style: TextStyle(fontSize: 27, height: 1.13, fontWeight: FontWeight.w800)),
    const SizedBox(height: 9), const Text('Every great game begins with one move.', style: TextStyle(color: AppColors.textMuted)),
    const SizedBox(height: 24),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24), gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
      colors: [Color(0xFF29203F), Color(0xFF171725), Color(0xFF11131D)]), border: Border.all(color: AppColors.purple.withOpacity(.28))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [Icon(Icons.bolt_rounded, color: AppColors.purpleLight), SizedBox(width: 8), Text('QUICK MATCH', style: TextStyle(letterSpacing: 1.6, fontSize: 11, fontWeight: FontWeight.w800))]),
        const SizedBox(height: 16), const Text('Sharpen your strategy', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
        const SizedBox(height: 7), const Text('Play a local demo game and explore the board.', style: TextStyle(color: AppColors.textMuted, height: 1.4)),
        const SizedBox(height: 18), SizedBox(width: double.infinity, child: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlayScreen())),
          icon: const Icon(Icons.play_arrow_rounded), label: const Text('Play now'))),
      ]),
    ),
    const SizedBox(height: 28),
    const Text('Your progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
    const SizedBox(height: 12),
    const Row(children: [
      Expanded(child: _StatCard(icon: Icons.emoji_events_outlined, value: '1200', label: 'Rating')),
      SizedBox(width: 10), Expanded(child: _StatCard(icon: Icons.check_circle_outline, value: '0', label: 'Wins')),
      SizedBox(width: 10), Expanded(child: _StatCard(icon: Icons.query_builder, value: '0', label: 'Games')),
    ]),
    const SizedBox(height: 26), const Text('Training room', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
    const SizedBox(height: 12),
    const _FeatureTile(icon: Icons.extension_rounded, title: 'Daily puzzles', subtitle: 'Tactical challenges coming soon'),
    const SizedBox(height: 10), const _FeatureTile(icon: Icons.school_outlined, title: 'Learn openings', subtitle: 'Build your opening repertoire'),
    const SizedBox(height: 10), const _FeatureTile(icon: Icons.analytics_outlined, title: 'Game review', subtitle: 'Analysis planned for a later phase'),
  ]);
}

class _StatCard extends StatelessWidget {
  final IconData icon; final String value; final String label;
  const _StatCard({required this.icon, required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(17), border: Border.all(color: const Color(0xFF292C3B))),
    child: Column(children: [
      Icon(icon, color: AppColors.purpleLight, size: 19), const SizedBox(height: 10),
      Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), const SizedBox(height: 4),
      Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
    ]));
}
class _FeatureTile extends StatelessWidget {
  final IconData icon; final String title; final String subtitle;
  const _FeatureTile({required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(17), border: Border.all(color: const Color(0xFF292C3B))),
    child: Row(children: [
      Container(width: 43, height: 43, decoration: BoxDecoration(color: AppColors.purple.withOpacity(.13), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: AppColors.purpleLight)),
      const SizedBox(width: 13), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ])), const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
    ]));
}
