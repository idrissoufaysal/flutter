import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:renteasy/Api/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/homeData.dart';
import '../models/home_models.dart';

class ApiServices {

//* Ajouter les maisons
Future<dynamic> saveProperty(
  int typeMaison,
  String desc,
  String adress,
  int nbrChambre,
  int price,
  List<File> images,
) async {
  try {
    // Envoyez les informations de la propriété à votre API
    final response = await http.post(
      Uri.parse('$Api_url/home'), // Remplacez l'URL par celle de votre API
      body: {
        'typeMaison': typeMaison.toString(),
        'desc': desc,
        'adress': adress,
        'nbrChambre': nbrChambre.toString(),
        'price': price.toString(),
      },
    );

    if (response.statusCode == 201) {
      final propertyId = jsonDecode(response.body)['id'];

      // Enregistrez les images et liez-les à la propriété
      await _uploadImages(images);

      // Indiquez à l'utilisateur que la propriété a été enregistrée avec succès
      // Affichez une alerte, une notification ou redirigez-le vers une autre page
    } else {
      // Gérez les erreurs si nécessaire
    }
  } catch (error) {
    // Gérez les erreurs d'exception si nécessaire
  }
}

///*Recuperation du token du utilisateur


  Future<dynamic> getHomes() async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    print("Fetching data from  with headers: $headers");
    var client = http.Client();
    var uri = Uri.parse(AllHome);
    try {
      var response = await client.get(uri,
      headers: headers);
      //var json = jsonDecode(response.body)['data'];

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body)['data'];
        print(json);
              return json;
              
        } else {
        throw Exception('Erreur lors de la récupération des maisons');
       }
      } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }


// Importez le modèle de conversation si vous en avez un

  //* Recuperation Token d'un user
  static Future<String?> getAuthToken() async {
    print("Fetching auth token from SharedPreferences...");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print("Auth token: $token");
    return token ?? '';
  }
 static Future<void> logout() async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    final uri = Uri.parse(Logout); // Assurez-vous que votre API a un endpoint de déconnexion

    try {
      final response = await http.post(uri, headers: headers);
      if (response.statusCode == 200) {
        // Effacez les données de l'utilisateur après la déconnexion
        await clearUserData();
      } else {
        throw Exception('Erreur lors de la déconnexion');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }
  

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }


//!La Messagerie/////////////////////////////////////////////////////////
  //* Méthode pour récupérer la liste des conversations
  Future<dynamic> getConversations(String userIdOrAdminId) async {
    var client = http.Client();
    var uri = Uri.parse(Api_url);
    try {
      var response = await client.get(uri);
      //var json = jsonDecode(response.body)['data'];

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
              return json;
              
        } else {
        throw Exception('Erreur lors de la récupération de la liste des conversations');
       }
      } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }



  //*Méthode pour récupérer les messages d'une conversation
  Future<dynamic> getMessagesByConversation(String conversationId) async {
    var client = http.Client();
    var uri = Uri.parse('$Api_url/conversations/$conversationId/messages');
 //*   
    try {
      var response = await client.get(uri);
      //var json = jsonDecode(response.body)['data'];

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
              return json;
              
        } else {
        throw Exception('Erreur lors de la récupération des messages d\'une conversation');
       }
      } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  //* Méthode pour envoyer un message
  Future<dynamic> sendMessage(String userId, String adminId, String content, bool isAdmin) async {
      var client = http.Client();

    final response = await http.post(
      Uri.parse('$Api_url/conversations/${isAdmin ? 'admin' : 'user'}/$adminId/${isAdmin ? 'user' : 'admin'}/$userId'),
      body: {'content': content},
    );
    
    if (response.statusCode == 200) {  // Utiliser le code 201 pour succès de création
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Erreur lors de l\'envoi du message');
    }
  }


//*gg//////////////////////////////////////////////////////////****** */ */
Future<void> _uploadImages(List<File> images) async {
  final authToken = await getAuthToken(); // Assurez-vous d'ajouter le token d'authentification
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $authToken',
  };

  for (var image in images) {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$Api_url/upload'), // Remplacez l'URL par celle de votre API
    );
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('images', image.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      // L'image a été téléchargée avec succès
    } else {
      // Gérez les erreurs si nécessaire
    }
  }
}
///*jh///////////////////////////////////////****/ */ */

// ...

Future<void> _selectImages() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Traitez l'image sélectionnée ici
    // Vous pouvez l'afficher dans un Widget ou l'envoyer à votre API
  }
}


    

}

