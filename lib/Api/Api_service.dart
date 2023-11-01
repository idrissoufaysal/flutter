import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  
  static const String _serverIP = '192.168.1.83';
  static const String baseUrl = 'http://$_serverIP:8000/api';
  static String get serverIP => _serverIP;
  static String currentIP = serverIP;

  // Ajoutez cette méthode pour obtenir l'adresse IP

  static Future<String?> getAuthToken() async {
    print("Fetching auth token from SharedPreferences...");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print("Auth token: $token");
    return token ?? '';
  }


  static T _handleResponse<T>(
      http.Response response, T Function(dynamic) modelFromJson) {
    print("Handling response with status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      T model = modelFromJson(jsonDecode(response.body));
      print("Parsed model from response: $model");
      return model;
    } else {
      print("Request failed with status: ${response.statusCode}");
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

//reponse de d'envoie
  static Future<http.Response> _postData(
      String endpoint, Map<String, dynamic> data) async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    print("Posting data to $endpoint with headers: $headers and data: $data");
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
      body: jsonEncode(data),
    );
    print("Received response: ${response.body}");
    return response;
  }

//* affichage des données de publication
  static Future<http.Response> _indexData(String endpoint) async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$authToken',
    };
    print("Fetching data from $endpoint with headers: $headers");
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
    );
    print("Received response: ${response.body}");
    return response;
  }

//update publication
  static Future<http.Response> _updateData(
      String endpoint, Map<String, dynamic> data) async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    print("Updating data at $endpoint with headers: $headers and data: $data");
    final response = await http.put(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
      body: jsonEncode(data),
    );
    print("Received response: ${response.body}");
    return response;
  }

//post publication
  static Future<http.Response> postPublication(
      Map<String, dynamic> data) async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    print("Posting publication with headers: $headers and data: $data");
    final response = await http.post(
      Uri.parse('$baseUrl/publications'),
      headers: headers,
      body: jsonEncode(data),
    );
    print("Received response: ${response.body}");
    return response;
  }

  //Pour supprimer les données
  static Future<http.Response> _deleteData(String endpoint) async {
    final authToken = await getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    final response = await http.delete(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
    );

    return response;
  }

  //fonction pour gérer l'url des images
  static String fixImageUrl(String originalUrl) {
    // print("Original URL: $originalUrl"); // Affiche l'URL original

    // Si l'URL est relative (commence par "/img/uploads/..."), ajoutez le préfixe
    if (originalUrl.startsWith("/img/uploads/")) {
      String fixedUrl = "http://$currentIP:8000$originalUrl";
      //  print("Fixed URL: $fixedUrl"); // Affiche l'URL après modification
      return fixedUrl;
    }

    var regex = RegExp(r"http:\/\/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})");

    // Si l'URL contient déjà l'adresse IP actuelle, retournez l'URL original
    if (originalUrl.contains(currentIP)) {
      //   print("URL already contains the current IP. No changes made.");
      return originalUrl;
    }

    String fixedUrl =
        originalUrl.replaceAllMapped(regex, (match) => "http://$currentIP");
    print("Fixed URL: $fixedUrl"); // Affiche l'URL après modification

    return fixedUrl;
  }

  //-------------- AUTHENTICATION --------------
  static Future<http.Response> login(Map<String, dynamic> data) {
    return _postData('/login', data);
  }

  //recuperer l'id de l'utilisateur
  static Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('userId') ?? 0;
  }

//-------------- s'enregeistrer dans la base de données
  static Future<http.Response> register(Map<String, dynamic> data) {
    return _postData('/register', data);
  }

// ----------------- se deconnecter
  static Future<void> logout() async {
    final response = await _postData('/logout', {});
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove('token');
      await pref.remove(
          'userId'); // Supposant que vous stockez également l'ID de l'utilisateur
    }
    // Vous pouvez également gérer d'autres codes de statut ou erreurs ici si nécessaire
  }

//----------Avoir les details de l'utilisateur
  static Future<http.Response> getUser() {
    return _indexData('/user');
  }

//----------Modifier les informations de l'utilisateur
  static Future<http.Response> updateUser(Map<String, dynamic> data) {
    return _updateData('/user', data);
  }

//----------avoir les images
  static String? getStringImage(File? file) {
    if (file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  //-------------- PUBLICATIONS --------------
  static Future<http.Response> getPublications() {
    return _indexData('/publications');
  }

  /*static Future<http.Response> getPublicationById(int id) {
    return _indexData('/publications/$id');
  }*/
  static Future<http.Response> getPublicationsByUserId(int userId) {
    return _indexData('/users/$userId/publications');
  }

  static Future<http.Response> deletePublication(int id) {
    return _deleteData('/publications/$id');
  }


//-------------- VISITES --------------
  static Future<http.Response> storeVisit(Map<String, dynamic> data) {
    return _postData('/visites', data);
  }

  static Future<http.Response> updateVisit(int id, Map<String, dynamic> data) {
    return _updateData('/visites/$id', data);
  }

  static Future<http.Response> showVisit(int id) {
    return _indexData('/visites/$id');
  }

  static Future<http.Response> getMyVisits() {
    return _indexData('/my-visites');
  }

  static Future<http.Response> getMyPublicationVisits() {
    return _indexData('/my-publication-visites');
  }

  //-------------- FAVORIS --------------
  static Future<http.Response> toggleFavoris(int publicationId) {
    return _postData('/toggle-favoris/$publicationId', {});
  }

  static Future<http.Response> getUserFavoris([int? userId]) {
    if (userId != null) {
      return _indexData('/user-favoris/$userId');
    }
    return _indexData('/user-favoris');
  }

  //-------------- SEARCH --------------
  static Future<http.Response> search(Map<String, dynamic> data) {
    return _postData('/search', data);
  }

  static Future<http.Response> searchByDescription(Map<String, dynamic> data) {
    return _postData('/search/description', data);
  }

  //-------------- CHAT --------------
  static Future<http.Response> checkChatExists(int userId1, int userId2) {
    return _indexData('/chat/exists/$userId1/$userId2');
  }

  static Future<http.Response> getChatMessages(int userId1, int userId2) {
    return _indexData('/chat/get/$userId1/$userId2');
  }

  static Future<http.Response> sendChatMessage(
      int receiverId, String message, int type) {
    Map<String, dynamic> data = {
      'recepteur_id': receiverId,
      'message': message,
      'type': type,
    };
    return _postData('/chat/send', data);
  }

  static Future<http.Response> initiateOrGetChatForPublication(
      int publicationId) {
    return _postData('/chat/initiate/$publicationId', {});
  }

  static Future<http.Response> getRecentChats() {
    return _indexData('/chat/recent');
  }
}