// import 'package:flutter/material.dart';
// import 'package:new_app/pages/home_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   final emaiLController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             spacing: 25,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // CircleAvatar(radius: 35, child: Icon(Icons.person)),
//               Image.asset('assets/man.jpg', height: 100, width: 100),

//               Text(
//                 'Login Screen',
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),

//               TextFormField(
//                 controller: emaiLController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value == '' || value == null) {
//                     return 'Email cannot be empty'; //we are passing the error here
//                   } else if (value == 'Ram') {
//                     return 'Name cannot be Ram';
//                   } else {
//                     return null; //this means no error as occured
//                   }
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//               TextFormField(
//                 controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value == '' || value == null) {
//                     return 'Password cannot be empty';
//                   } else if (value.length < 3) {
//                     return 'Password too short';
//                   } else {
//                     return null;
//                   }
//                 },
//                 obscureText: true, //hides the text while typing
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     if (emaiLController.text.trim() == 'Rahul@gmail.com' &&
//                         passwordController.text.trim() == 'Rahul123') {
//                       //IF the above condition is satisfied ,then goto homepage
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return HomePage();
//                           },
//                         ),
//                       );

//                       Navigator.of(context).pop();
//                     }
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         behavior: SnackBarBehavior.fixed,
//                         content: Text('Form submit successful'),
//                         backgroundColor: Colors.green,
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         behavior: SnackBarBehavior.floating,
//                         content: Text('Form Error '),
//                         backgroundColor: Colors.red,
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
