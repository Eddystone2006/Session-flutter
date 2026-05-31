import 'package:flutter/material.dart';
import 'loginPage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("chargement en cours", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
