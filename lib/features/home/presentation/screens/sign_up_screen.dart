import 'package:belajar_riverpod/features/authentication/domain/providers/login_provider.dart';
import 'package:belajar_riverpod/features/authentication/presentation/providers/auth_providers.dart';
import 'package:belajar_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:belajar_riverpod/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final TextEditingController nameController = TextEditingController(text: 'officerlc');
  final TextEditingController emailController = TextEditingController(text: 'dev@languagecenter.id');
  final TextEditingController passwordController = TextEditingController(text: 'officerlc');

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

        if(next.state == AuthConcreteState.signUpSuccess){
          GoRouter.of(context).go('/login');
        }
        
      })
    );

    return Scaffold(
    appBar: AppBar(
      title: Text('Register'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthField(
              hintText: 'Name Controller',
              controller: nameController,
            ),
            AuthField(
              hintText: 'Email',
              controller: emailController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            state.map(
              failure: (value) => register(ref),
              initial: () => register(ref),
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => register(ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget register(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {

        ref.read(authStateNotifierProvider.notifier).registerUser(
              nameController.text,
              emailController.text,
              passwordController.text,
            );
      },
      child: const Text('Register'),
    );
  }
    
}