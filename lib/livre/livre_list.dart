import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'livre.dart';
import 'livre_details.dart';

class LivreList extends StatefulWidget {
  const LivreList({super.key});

  State<LivreList> createState() => _LivreListState();
}

class _LivreListState extends State<LivreList> {
  final List<Livre> livres = [
  Livre('001', 'NARUTO', 'Masashi Kishimoto', 'Shonen-Arts Martiaux-Drame', 4.7),
  Livre('002', 'BLEACH', 'Tite Kubo', 'Shonen-Surnaturel-Urban Fantasy', 5.0),
  Livre('003', 'One Piece', 'Eiichiro Oda', 'Shonen-Aventures-Comédie', 4.8),
  Livre('004', 'Dragon Ball', 'Akira Toriyama', 'Shonen-Aventures-Science Fiction', 4.9),
  Livre('005', 'Death Note', 'Tsugumi Ohba', 'Thriller-Psychologique-Surnaturel', 4.9),
  Livre('006', 'Attack on Titan', 'Hajime Isayama', 'Dark Fantasy-Action-Drame', 4.9),
  Livre('007', 'Fullmetal Alchemist', 'Hiromu Arakawa', 'Aventure-Steampunk-Drame', 4.9),
  Livre('008', 'Hunter x Hunter', 'Yoshihiro Togashi', 'Shonen-Aventure-Fantastique', 4.8),
  Livre('009', 'Demon Slayer', 'Koyoharu Gotouge', 'Action-Historique-Surnaturel', 4.7),
  Livre('010', 'Jujutsu Kaisen', 'Gege Akutami', 'Action-Surnaturel-Horreur', 4.8),
  Livre('011', 'My Hero Academia', 'Kohei Horikoshi', 'Shonen-Super-héros-Action', 4.6),
  Livre('012', 'One Punch Man', 'ONE / Yusuke Murata', 'Action-Comédie-Parodie', 4.7),
  Livre('013', 'Tokyo Ghoul', 'Sui Ishida', 'Dark Fantasy-Horreur-Psychologique', 4.5),
  Livre('014', 'Berserk', 'Kentaro Miura', 'Dark Fantasy-Action-Tragédie', 5.0),
  Livre('015', 'Vinland Saga', 'Makoto Yukimura', 'Historique-Action-Drame', 4.8),
  Livre('016', 'Vagabond', 'Takehiko Inoue', 'Historique-Arts Martiaux-Philosophie', 4.9),
  Livre('017', 'Haikyu!!', 'Haruichi Furudate', 'Sport-Comédie-Shonen', 4.8),
  Livre('018', 'Slam Dunk', 'Takehiko Inoue', 'Sport-Comédie-Drame', 4.7),
  Livre('019', 'Monster', 'Naoki Urasawa', 'Thriller-Psychologique-Mystère', 4.9),
  Livre('020', 'JoJo’s Bizarre Adventure', 'Hirohiko Araki', 'Aventure-Surnaturel-Action', 4.8),
  Livre('021', 'Chainsaw Man', 'Tatsuki Fujimoto', 'Action-Horreur-Comédie noire', 4.7),
  Livre('022', 'Spy x Family', 'Tatsuya Endo', 'Comédie-Espionnage-Action', 4.8),
  Livre('023', 'The Promised Neverland', 'Kaiu Shirai', 'Thriller-Mystère-Surnaturel', 4.5),
  Livre('024', 'Black Clover', 'Yūki Tabata', 'Shonen-Fantastique-Action', 4.4),
  Livre('025', 'Fairy Tail', 'Hiro Mashima', 'Shonen-Fantastique-Aventure', 4.3),
  Livre('026', 'Blue Lock', 'Muneyuki Kaneshiro', 'Sport-Thriller-Action', 4.6),
  Livre('027', 'Dr. Stone', 'Riichiro Inagaki', 'Science Fiction-Aventure', 4.7),
  Livre('028', 'Solo Leveling', 'Chugong', 'Action-Fantasy-Système', 4.8),
  Livre('029', 'Kingdom', 'Yasuhisa Hara', 'Historique-Militaire-Action', 4.8),
  Livre('030', 'Neon Genesis Evangelion', 'Yoshiyuki Sadamoto', 'Mecha-Psychologique-SF', 4.7),
  Livre('031', 'Cowboy Bebop', 'Hajime Yatate', 'Espace-Western-Noir', 4.9),
  Livre('032', 'Mob Psycho 100', 'ONE', 'Action-Comédie-Surnaturel', 4.8),
  Livre('033', 'Assassination Classroom', 'Yusei Matsui', 'Comédie-SF-Action', 4.6),
  Livre('034', 'Seven Deadly Sins', 'Nakaba Suzuki', 'Fantasy-Action-Aventure', 4.2),
  Livre('035', 'Code Geass', 'Goro Taniguchi', 'Mecha-Militaire-Thriller', 4.8),
  Livre('036', 'Gintama', 'Hideaki Sorachi', 'Comédie-Samouraï-SF', 4.9),
  Livre('037', 'Your Lie in April', 'Naoshi Arakawa', 'Drame-Romance-Musique', 4.8),
  Livre('038', 'A Silent Voice', 'Yoshitoki Ōima', 'Drame-Tranche de vie', 4.9),
  Livre('039', 'Black Butler', 'Yana Toboso', 'Dark Fantasy-Mystère-Surnaturel', 4.5),
  Livre('040', 'Food Wars!', 'Yuto Tsukuda', 'Cuisine-Comédie-Shonen', 4.4),
  Livre('041', 'Fire Force', 'Atsushi Ohkubo', 'Action-Surnaturel-SF', 4.5),
  Livre('042', 'Blue Exorcist', 'Kazue Kato', 'Action-Surnaturel-Fantasy', 4.3),
  Livre('043', 'Sailor Moon', 'Naoko Takeuchi', 'Magical Girl-Romance', 4.4),
  Livre('044', 'Yu-Gi-Oh!', 'Kazuki Takahashi', 'Jeu-Aventure-Surnaturel', 4.5),
  Livre('045', 'Steins;Gate', 'Yomi Sarachi', 'SF-Thriller-Voyage temporel', 4.9),
  Livre('046', 'Parasyte', 'Hitoshi Iwaaki', 'Horreur-SF-Psychologique', 4.7),
  Livre('047', 'Tokyo Revengers', 'Ken Wakui', 'Action-Voyage temporel-Drame', 4.4),
  Livre('048', 'Fruits Basket', 'Natsuki Takaya', 'Romance-Drame-Fantastique', 4.8),
  Livre('049', 'Great Teacher Onizuka', 'Toru Fujisawa', 'Comédie-Tranche de vie', 4.9),
  Livre('050', 'Hellsing', 'Kota Hirano', 'Action-Horreur-Surnaturel', 4.6),
  Livre('051', 'Rurouni Kenshin', 'Nobuhiro Watsuki', 'Historique-Samouraï-Action', 4.7),
  Livre('052', 'D.Gray-man', 'Katsura Hoshino', 'Action-Dark Fantasy-Surnaturel', 4.5),
  Livre('053', 'Soul Eater', 'Atsushi Ohkubo', 'Action-Fantastique-Comédie', 4.6),
  Livre('054', 'Mushishi', 'Yuki Urushibara', 'Surnaturel-Mystère-Tranche de vie', 4.8),


  ];

  final TextEditingController searchController = TextEditingController();
  late List<Livre> searchResults;
  Set<String> favoriteIds = {}; 

  void initState() {
    super.initState();
    searchResults = livres;
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favoriteLivres') ?? [];
    setState(() {
      favoriteIds = saved.toSet();
      for (var livre in livres) {
        livre.isFavorite = favoriteIds.contains(livre.id);
      }
    });
  }

  Future<void> _toggleFavorite(Livre livre) async {
    setState(() {
      livre.isFavorite = !livre.isFavorite;
      if (livre.isFavorite) {
        favoriteIds.add(livre.id);
      } else {
        favoriteIds.remove(livre.id);
      }
    });
    await _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteLivres', favoriteIds.toList());
  }

  void doSearch() {
    final q = searchController.text.trim().toLowerCase();
    if (q.isEmpty) {
      setState(() => searchResults = livres);
      return;
    }

    setState(() {
      searchResults = livres.where((l) {
        return l.id.toLowerCase() == q ||
            l.titre.toLowerCase().contains(q) ||
            l.auteur.toLowerCase().contains(q);
      }).toList();
    });
  }

  Future<void> showAddDialog() {
    final id = TextEditingController();
    final titre = TextEditingController();
    final auteur = TextEditingController();
    final genre = TextEditingController();
    final note = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ajouter un livre'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: id,
                  decoration: const InputDecoration(label: Text('ID')),
                ),
                TextField(
                  controller: titre,
                  decoration: const InputDecoration(label: Text('Titre')),
                ),
                TextField(
                  controller: auteur,
                  decoration: const InputDecoration(label: Text('Auteur')),
                ),
                TextField(
                  controller: genre,
                  decoration: const InputDecoration(label: Text('Genre')),
                ),
                TextField(
                  controller: note,
                  decoration: const InputDecoration(label: Text('Note (0-5)')),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (id.text.isEmpty ||
                    titre.text.isEmpty ||
                    auteur.text.isEmpty ||
                    genre.text.isEmpty ||
                    note.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Veuillez remplir tous les champs'),
                    ),
                  );
                  return;
                }

                final n = double.tryParse(note.text.replaceAll(',', '.')) ?? 0.0;
                setState(() {
                  final newLivre = Livre(
                    id.text.trim(),
                    titre.text.trim(),
                    auteur.text.trim(),
                    genre.text.trim(),
                    n,
                  );
                  livres.add(newLivre);
                  searchResults = livres;
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Livre ajouté')), 
                );
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  void _deleteLivre(int index) {
    setState(() {
      final removed = searchResults[index];
      livres.removeWhere((l) => l.id == removed.id);
      favoriteIds.remove(removed.id);
      searchResults = livres;
    });
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setStringList('favoriteLivres', favoriteIds.toList()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des livres'),
        centerTitle: true,
        actions: [

          IconButton(
            onPressed: () {
              setState(() {
                searchController.text = '';
                searchResults = livres;
              });
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Rechercher par ID, titre ou auteur',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: doSearch,
                  child: const Text('Rechercher'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final livre = searchResults[index];
                return Card(
                  child: ListTile(
                    title: Text(livre.titre),
                    subtitle: Text('${livre.auteur} • ${livre.genre}'),
                    trailing: IconButton(
                      icon: Icon(
                        livre.isFavorite ? Icons.star : Icons.star_border,
                        color: livre.isFavorite ? const Color.fromARGB(255, 243, 255, 11) : null,
                      ),
                      onPressed: () => _toggleFavorite(livre),
                    ),
                    onTap: () async {
                      final res = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LivreDetails(livre: livre),
                        ),
                      );

                      if (res != null && res is Map<String, dynamic>) {
                        if (res['action'] == 'delete') {
                          _deleteLivre(index);
                        } else if (res['action'] == 'update' &&
                            res['livre'] is Livre) {
                          final updated = res['livre'] as Livre;
                          setState(() {
                            final existingIndex =
                                livres.indexWhere((l) => l.id == updated.id);
                            if (existingIndex != -1) {
                              livres[existingIndex] = updated;
                            }
                            searchResults = livres;
                            if (updated.isFavorite) {
                              favoriteIds.add(updated.id);
                            } else {
                              favoriteIds.remove(updated.id);
                            }
                          });
                          await _saveFavorites();
                        }
                      }
                    },
                    onLongPress: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Supprimer'),
                            content: const Text(
                              'Voulez-vous supprimer ce livre ?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Annuler'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _deleteLivre(index);
                                  Navigator.pop(context);
                                },
                                child: const Text('Supprimer'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
