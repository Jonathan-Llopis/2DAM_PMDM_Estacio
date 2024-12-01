import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_event.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_state.dart';

import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            } else if (state.email != null && state.email != "NO_USER") {
              context.go('/visits', extra: state.email);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const SizedBox(height: 100),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                  email: email, password: password),
                            );
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginGoogle());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.g_mobiledata),
                          SizedBox(width: 8),
                          Text('Login with Google'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
