import 'home_images.dart';

class Home {
  final int id;
  final String typeMaison;
  final String desc;
  final String adress;
  final int nbrChambre;
  final int price;
  final List<HomeImage> images;


  Home({
    required this.id,
    required this.typeMaison,
    required this.desc,
    required this.adress,
    required this.nbrChambre,
    required this.price,
    required this.images,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    var imageList = json['images'] as List;
    List<HomeImage> images = imageList.map((image) => HomeImage.fromJson(image)).toList();

    return Home(
      id: json['id'],
      typeMaison: json['typeMaison'],
      desc: json['desc'],
      adress: json['adress'],
      nbrChambre: json['nbrChambre'],
      price: json['price'],
      images: images,
    );
  }
}
