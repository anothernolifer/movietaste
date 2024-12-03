
import 'package:flutter/material.dart';
import 'package:movie_taste/screens/kys.dart';
import 'package:movie_taste/screens/register_screen.dart';
import 'package:movie_taste/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/login_page.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextField(
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    TextField(
                      decoration: const InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Consumer<AuthService>(
                      builder: (context, authServiceProvider, child) {
                        return SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: authServiceProvider.isLoading
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              : ElevatedButton(
                            onPressed: () async {

                              bool success = await authServiceProvider.loginEmployee(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context,
                              );

                              if (success) {

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KysScreen(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                      ),
                      child: const Text(
                        "Are you a new user? Register here",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
