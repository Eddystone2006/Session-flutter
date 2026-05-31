import 'package:flutter/material.dart';
import 'livre/livre_list.dart';
import 'loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bibliothèque"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 255, 140),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Bienvenue dans l'application de gestion de livres",
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LivreList(),
                      ),
                    );
                  },
                  child: const Text("Liste des livres"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("Deconnnexion"),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
