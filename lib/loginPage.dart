import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final name = TextEditingController();
  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 105, 233, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "entrer votre nom",
                label: Text("Nom"),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "entrer votre mot de passe",
                label: Text("Mot de passe"),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if ((name.text == "Ichigo" && password.text == "bankai") ||
                    (name.text == "Eddystone" && password.text == "Eddy2006") ||
                    (name.text == "Goku" && password.text == "beerus")) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('mot de passe incorrect'),
                    ),
                  );
                }
              },
              child: const Text("Connexion"),
            ),
          ],
        ),
      ),
    );
  }
}
