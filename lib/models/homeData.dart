class House {
  House({
    required this.id,
    required this.amount,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.squarefoot,
    required this.garages,
    required this.kitchen,
  });

  int amount;
  int bedrooms;
  int bathrooms;
  int garages;
  int kitchen;
  String address;
  double squarefoot;
  int id;
}

// class Home {
//   final int id;
//   final String typeMaison;
//   final String desc;
//   final String adress;
//   final String nbreChambre;
//   final List<ImageData> images;

//   Home({
//     required this.id,
//     required this.typeMaison,
//     required this.desc,
//     required this.adress,
//     required this.nbreChambre,
//     required this.images,
//   });

//   factory Home.fromJson(Map<String, dynamic> json) {
//     return Home(
//       id: json['id'],
//       typeMaison: json['typeMaison'],
//       desc: json['desc'],
//       adress:json['adress'],
//       nbreChambre: json['desc'],
//       images: List<ImageData>.from(
//           json['images'].map((imageJson) => ImageData.fromJson(imageJson))),
//     );
//   }
// }

// class ImageData {
//   final String path;

//   ImageData({required this.path});

//   factory ImageData.fromJson(Map<String, dynamic> json) {
//     return ImageData(
//       path: json['path'],
//     );
//   }
// }
