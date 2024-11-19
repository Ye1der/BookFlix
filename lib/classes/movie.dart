class Movie {
  final String title;
  final String overview;
  final String img;
  final double calification;

  Movie({
    required this.title,
    required this.overview,
    required this.img,
    required this.calification,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'overview': overview,
      'img': img,
      'calification': calification
    };
  }

  static Movie toObj(Map<String, dynamic> map) {
    return Movie(
      calification: map['calification'],
      title: map['title'],
      img: map['img'],
      overview: map['overview']
    );
  }
}
