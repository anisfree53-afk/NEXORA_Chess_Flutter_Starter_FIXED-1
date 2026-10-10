import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  bool _sound = true, _haptics = true, _coordinates = true;
  String _boardTheme = 'Violet stone';

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w800))),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const _Label('GAMEPLAY'), const SizedBox(height: 10),
      _SettingCard(children: [
        SwitchListTile(value: _sound, onChanged: (v) => setState(() => _sound = v), title: const Text('Sound effects'), subtitle: const Text('Preference preview only', style: TextStyle(color: AppColors.textMuted, fontSize: 12)), activeColor: AppColors.purple),
        const Divider(height: 1),
        SwitchListTile(value: _haptics, onChanged: (v) => setState(() => _haptics = v), title: const Text('Haptic feedback'), subtitle: const Text('Not connected to device vibration yet', style: TextStyle(color: AppColors.textMuted, fontSize: 12)), activeColor: AppColors.purple),
        const Divider(height: 1),
        SwitchListTile(value: _coordinates, onChanged: (v) => setState(() => _coordinates = v), title: const Text('Board coordinates'), activeColor: AppColors.purple),
      ]),
      const SizedBox(height: 24), const _Label('APPEARANCE'), const SizedBox(height: 10),
      _SettingCard(children: [
        ListTile(title: const Text('Board theme'), subtitle: Text(_boardTheme, style: const TextStyle(color: AppColors.textMuted)), trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => showModalBottomSheet<void>(context: context, backgroundColor: AppColors.surface, builder: (context) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [
            for (final theme in ['Violet stone', 'Classic wood', 'Chess green', 'Neon galaxy'])
              ListTile(title: Text(theme), trailing: _boardTheme == theme ? const Icon(Icons.check, color: AppColors.purpleLight) : null,
                onTap: () { setState(() => _boardTheme = theme); Navigator.pop(context); }),
            const SizedBox(height: 8),
          ])))),
        const Divider(height: 1),
        const ListTile(title: Text('Piece style'), subtitle: Text('Classic symbols · more sets planned', style: TextStyle(color: AppColors.textMuted)), trailing: Icon(Icons.chevron_right_rounded)),
      ]),
      const SizedBox(height: 24), const _Label('ABOUT'), const SizedBox(height: 10),
      const _SettingCard(children: [
        ListTile(title: Text('NEXORA Chess'), subtitle: Text('Starter build 1.0.0', style: TextStyle(color: AppColors.textMuted))),
        Divider(height: 1),
        ListTile(title: Text('Privacy'), subtitle: Text('Demo only; this build does not send your data.', style: TextStyle(color: AppColors.textMuted))),
      ]),
    ]));
}
class _Label extends StatelessWidget {
  final String text; const _Label(this.text);
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(color: AppColors.textMuted, fontSize: 11, letterSpacing: 1.6, fontWeight: FontWeight.w800));
}
class _SettingCard extends StatelessWidget {
  final List<Widget> children; const _SettingCard({required this.children});
  @override
  Widget build(BuildContext context) => Container(decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(17), border: Border.all(color: const Color(0xFF292C3B))), child: Column(children: children));
}
