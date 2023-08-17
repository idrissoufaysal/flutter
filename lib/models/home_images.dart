class HomeImage {
  final int id;
  final String imagePath;


  HomeImage({
    required this.id,
    required this.imagePath,
  });

  factory HomeImage.fromJson(Map<String, dynamic> json) {
    
    return HomeImage(
      id: json['id'],
      imagePath: json['./public/images'],
    );
  }
}
