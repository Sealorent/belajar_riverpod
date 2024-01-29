import 'package:belajar_riverpod/features/authentication/presentation/providers/auth_providers.dart';
import 'package:belajar_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:belajar_riverpod/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  
  
  final TextEditingController emailController =
      TextEditingController(text: 'dev@languagecenter.id');
  final TextEditingController passwordController =
      TextEditingController(text: 'devlcbisa');
  final TextEditingController fcmTokenController =
      TextEditingController(text: 'fr07KOE5SyWMJAwqnI5o1w:APA91bEehyCq1c95oLZEMTpBf8MFl7A99YME3WxCU5tg75QXAraIbJD4RF7tyYl-btleBrQPyqG-4KhFJCkZwiq08QCfEYfvgKTYcp7QMrdVnhYWrib6cJxHzmjDn--xh_RaEm1Sgs49');


  @override
  Widget build(BuildContext context) {

  final state = ref.watch(authStateNotifierProvider);

  ref.listen(
    authStateNotifierProvider.select((value) => value),
      ((AuthState? previous, AuthState next) {
        //show Snackbar on failure
        if (next.state == AuthConcreteState.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.message.toString())));
        }
      })
  );
    
  return Scaffold(
    appBar: AppBar(
      title: Text('signIn'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthField(
              hintText: 'Username',
              controller: emailController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            state.map(
              failure: (value) => loginButton(ref),
              initial: () => loginButton(ref),
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => loginButton(ref),
              signInSuccess: () => const Center(child: Text('Login Success')),
              signUpSuccess: () => loginButton(ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(authStateNotifierProvider.notifier).loginUser(
              emailController.text,
              passwordController.text,
              fcmTokenController.text
            );
          },
          child: const Text('Login'),
        ),
        ElevatedButton(
          onPressed: (){
            context.go('/sign-up');
          }, 
          child: const Text('Register'),
        )
      ],
    );
  }


}