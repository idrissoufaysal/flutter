import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:renteasy/Api/config.dart';
import 'package:http/http.dart' as http;
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/widgets/bottom_bar.dart';


class  AuthentificationProvider extends ChangeNotifier{
final requestBaseUrl=Api_url;

//Setters
bool _isLoading=false;
String _resMessage='';

//getters
bool get isLoading=>_isLoading;
String get resMessage=>_resMessage;


//Register user with email and password
void register({
  required String email,
  required String password,
  required String nom,
  required String prenom,
  required String telephone,
  BuildContext? context
  
})async{
_isLoading=true;
notifyListeners();


final body={
  "nom":nom,
  "prenom":prenom,
  "email":email,
  "telephone":telephone,
  "password":password,
  
};

print(body);
try {
  http.Response response= await http.post(Uri.parse(Registration),body: jsonEncode(body));
  if(response.statusCode==200 || response.statusCode==201){
    final json=jsonDecode(response.body);
    print(json);
    _isLoading=false;
    _resMessage=json['message'];
    Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => LoginPage(
              ),
            ),
          );
    notifyListeners();
  }

} on SocketException catch(_){
 _isLoading=false;
 _resMessage="Erreur au niveau de la connexion internet";
}
catch (e) {
  _isLoading=false;
  _resMessage="Veuillez reesayer";
  notifyListeners();

  print("errrooo :: $e");
}

}

//Login
void login({
  required String email,
  required String password,
  BuildContext? context
  
})async{
_isLoading=true;
notifyListeners();


final body={
  
  "email":email,
  "password":password,
  };

print(body);
try {
  http.Response response= await http.post(Uri.parse(Login),body: jsonEncode(body));
  if(response.statusCode==200 || response.statusCode==201){
    final json=jsonDecode(response.body);
    print(json);
    _isLoading=false;
    _resMessage=json['message'];
     if (context != null) { // Vérifier si context n'est pas null
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBar(
              token: json['token'],
              index: 0,
            ),
          ),
        );
      }
    notifyListeners();
  }

} on SocketException catch(_){
 _isLoading=false;
 _resMessage="Erreur au niveau de la connexion internet";
}
catch (e) {
  _isLoading=false;
  _resMessage="Veuillez reesayer";
  notifyListeners();

  print("errrooo:: $e");
}

}

}