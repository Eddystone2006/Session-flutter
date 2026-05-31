import 'package:flutter/material.dart';
import 'livre.dart';

class LivreDetails extends StatefulWidget {
  const LivreDetails({super.key, required this.livre});
  final Livre livre;

  
  State<LivreDetails> createState() => _LivreDetailsState();
}

class _LivreDetailsState extends State<LivreDetails> {
  late TextEditingController idController;
  late TextEditingController titreController;
  late TextEditingController auteurController;
  late TextEditingController genreController;
  late TextEditingController noteController;

  late bool isFavorite;

  
  void initState() {
    super.initState();
    idController = TextEditingController(text: widget.livre.id);
    titreController = TextEditingController(text: widget.livre.titre);
    auteurController = TextEditingController(text: widget.livre.auteur);
    genreController = TextEditingController(text: widget.livre.genre);
    noteController = TextEditingController(text: widget.livre.note.toString());
    isFavorite = widget.livre.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livre.titre),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(label: Text('ID')),
            ),
            TextField(
              controller: titreController,
              decoration: const InputDecoration(label: Text('Titre')),
            ),
            TextField(
              controller: auteurController,
              decoration: const InputDecoration(label: Text('Auteur')),
            ),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(label: Text('Genre')),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(label: Text('Note (0-5)')),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final n = double.tryParse(
                          noteController.text.replaceAll(',', '.'),
                        ) ??
                        0.0;
                    final updated = Livre(
                      idController.text.trim(),
                      titreController.text.trim(),
                      auteurController.text.trim(),
                      genreController.text.trim(),
                      n,
                      isFavorite: isFavorite,
                    );
                    Navigator.pop(context, {
                      'action': 'update',
                      'livre': updated,
                    });
                  },
                  child: const Text('Enregistrer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {'action': 'delete'});
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
