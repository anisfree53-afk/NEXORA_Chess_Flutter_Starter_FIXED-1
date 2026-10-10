import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_mark.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _createAccount = false;
  bool _obscure = true;

  @override
  void dispose() { _email.dispose(); _password.dispose(); super.dispose(); }

  void _continue() {
    FocusScope.of(context).unfocus();
    if (_email.text.trim().isEmpty || !_email.text.contains('@') || _password.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a valid email and a password of at least 6 characters.')));
      return;
    }
    Navigator.of(context).pushReplacementNamed('/home');
    // Demo-only: no credentials are sent or saved.
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Center(child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 22), const BrandMark(size: 76), const SizedBox(height: 18),
          const Text('NEXORA CHESS', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 3)),
          const SizedBox(height: 34),
          Text(_createAccount ? 'Create your account' : 'Welcome back', textAlign: TextAlign.center, style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          const Text('Your next move starts here.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 28),
          TextField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(prefixIcon: Icon(Icons.mail_outline), hintText: 'Email address')),
          const SizedBox(height: 14),
          TextField(controller: _password, obscureText: _obscure, decoration: InputDecoration(prefixIcon: const Icon(Icons.lock_outline), hintText: 'Password',
            suffixIcon: IconButton(onPressed: () => setState(() => _obscure = !_obscure), icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined)))),
          if (!_createAccount) Align(alignment: Alignment.centerRight, child: TextButton(
            onPressed: () => showDialog<void>(context: context, builder: (_) => AlertDialog(
              title: const Text('Forgot password?'),
              content: const Text('Password recovery is a placeholder in this demo. No email will be sent.'),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
            )),
            child: const Text('Forgot password?'),
          )) else const SizedBox(height: 12),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: _continue, child: Text(_createAccount ? 'Create demo account' : 'Sign in')),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Google sign-in is not connected in this demo.'))),
            icon: const Text('G', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF8AB4F8))),
            label: const Text('Continue with Google'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white, minimumSize: const Size(0, 52),
              side: const BorderSide(color: Color(0xFF303344)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          ),
          const SizedBox(height: 20),
          Wrap(alignment: WrapAlignment.center, children: [
            Text(_createAccount ? 'Already have an account? ' : 'New to NEXORA? ', style: const TextStyle(color: AppColors.textMuted)),
            GestureDetector(onTap: () => setState(() => _createAccount = !_createAccount),
              child: Text(_createAccount ? 'Sign in' : 'Create account', style: const TextStyle(color: AppColors.purpleLight, fontWeight: FontWeight.w800))),
          ]),
          const SizedBox(height: 28),
          const Text('DEMO ONLY · NO DATA IS SENT', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted, fontSize: 10, letterSpacing: 1.4)),
        ],
      )),
    ))),
  );
}
