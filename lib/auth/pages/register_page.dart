import 'package:flutter/material.dart';
import 'package:new_app/providers/form_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<FormProvider>();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/auth/register_grocery.png',
                  height: 250,
                  width: 250,
                ),
                Text(
                  'Register Form',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextFormField(
                  controller: userNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: formProvider.nameValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Username'),
                    hintText: 'Enter the username',
                  ),
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
                  controller: phoneNoController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: formProvider.phoneNoValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Phone No'),
                    hintText: 'Enter the phone no.',
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
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Form Validation Successful !!!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Form Validation Successful !!!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
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
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Login Here', style: TextStyle(fontSize: 16)),
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
