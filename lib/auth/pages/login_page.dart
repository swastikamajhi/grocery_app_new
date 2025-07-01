import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_storage_service.dart';
import 'package:new_app/providers/form_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<FormProvider>();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/auth/login_grocery.png',
                  height: 250,
                  width: 250,
                ),
                Text(
                  'Login Form',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: formProvider.emailValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                    hintText: 'Enter the email',
                  ),
                ),

                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: formProvider.passwordValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                    hintText: 'Enter the password',
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (emailController.text == 'Rahul@gmail.com' &&
                          passwordController.text == 'Rahul1234') {
                        LocalStorageService.setUserLoggedIn();
                        Navigator.pushNamed(context, '/mainNav');
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Successful !!!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email and Password Invalid !!!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Register Here',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
