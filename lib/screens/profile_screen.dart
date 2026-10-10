import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_mark.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Your profile', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const SizedBox(height: 10), const BrandMark(size: 82), const SizedBox(height: 16),
      const Text('NEXORA Player', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6), const Text('Guest profile · Demo data', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
      const SizedBox(height: 24),
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF292C3B))),
        child: const Column(children: [
          Text('1200', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: AppColors.purpleLight)),
          SizedBox(height: 3), Text('STARTING RATING · SAMPLE', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppColors.textMuted)),
          SizedBox(height: 18), Divider(),
          Row(children: [Expanded(child: _ProfileStat(value: '0', label: 'Wins')), Expanded(child: _ProfileStat(value: '0', label: 'Draws')), Expanded(child: _ProfileStat(value: '0', label: 'Losses'))]),
        ])),
      const SizedBox(height: 22), const Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      const _Achievement(icon: Icons.flag_outlined, title: 'First steps', subtitle: 'Play your first completed game'),
      const SizedBox(height: 10), const _Achievement(icon: Icons.local_fire_department_outlined, title: 'On a streak', subtitle: 'Win 3 games in a row'),
      const SizedBox(height: 10), const _Achievement(icon: Icons.school_outlined, title: 'Student of chess', subtitle: 'Complete 10 puzzles'),
      const SizedBox(height: 18),
      OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile editing and image upload are not implemented yet.'))),
        icon: const Icon(Icons.edit_outlined), label: const Text('Edit profile (coming soon)')),
    ]));
}
class _ProfileStat extends StatelessWidget {
  final String value; final String label;
  const _ProfileStat({required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Column(children: [Text(value, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800)), const SizedBox(height: 4), Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 12))]);
}
class _Achievement extends StatelessWidget {
  final IconData icon; final String title; final String subtitle;
  const _Achievement({required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF292C3B))),
    child: Row(children: [
      Container(width: 44, height: 44, decoration: BoxDecoration(color: AppColors.purple.withOpacity(.13), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: AppColors.purpleLight)),
      const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ])), const Icon(Icons.lock_outline, size: 17, color: AppColors.textMuted),
    ]));
}
