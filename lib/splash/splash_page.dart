import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_storage_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkAuthStatusAndNavigate();
    super.initState();
  }

  void checkAuthStatusAndNavigate() async {
    final isUserLoggedIn = await LocalStorageService.getUserLoggedIn();

    if (isUserLoggedIn) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        if (!context.mounted) return;
        Navigator.pushNamed(context, '/mainNav');
      });
    } else {
      Future.delayed(Duration(seconds: 2)).then((value) {
        if (!context.mounted) return;
        Navigator.pushNamed(context, '/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Image.asset(
                  "assets/splash/splash_icon.png",
                  height: 50,
                  width: 50,
                ),
                Text(
                  'Grocery App',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
