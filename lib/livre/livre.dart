class Livre {
  String id;
     String titre;
  String auteur;
  String genre;
  double note;
  bool isFavorite;

  Livre(this.id,this.titre,this.auteur,this.genre,this.note, {this.isFavorite = false,
  });
}
