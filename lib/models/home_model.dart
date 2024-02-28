class Homes {
  int? id;
  String? typeMaison;
  String? desc;
  String? adress;
  int? nbrChambre;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? userId;
  List<Images>? images;

  Homes(
      {this.id,
      this.typeMaison,
      this.desc,
      this.adress,
      this.nbrChambre,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.images});

  Homes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeMaison = json['typeMaison'];
    desc = json['desc'];
    adress = json['adress'];
    nbrChambre = json['nbrChambre'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typeMaison'] = this.typeMaison;
    data['desc'] = this.desc;
    data['adress'] = this.adress;
    data['nbrChambre'] = this.nbrChambre;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? homeImages;
  String? createdAt;
  String? updatedAt;
  int? maisonId;

  Images(
      {this.id,
      this.homeImages,
      this.createdAt,
      this.updatedAt,
      this.maisonId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeImages = json['homeImages'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    maisonId = json['maisonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['homeImages'] = this.homeImages;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['maisonId'] = this.maisonId;
    return data;
  }
}