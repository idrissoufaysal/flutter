
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/widgets/main_botton.dart';
import 'package:http/http.dart' as http;

import '../Api/config.dart';
import '../N_widget/menu_widget.dart';
import '../components/colors.dart';
import '../widgets/text_fild.dart';

class AddPropriete extends StatefulWidget {
  const AddPropriete({super.key});

  @override
  State<AddPropriete> createState() => _AddProprieteState();
}

class _AddProprieteState extends State<AddPropriete> {
  TextEditingController _typeMaisonController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _mbreChambreController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _adressContoller = TextEditingController();
  bool _isNotValidate = false;

  final picker = ImagePicker();
List<XFile> _selectedImages = [];

  Future<void> _selectImages() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Traitez l'image sélectionnée ici
      // Vous pouvez l'afficher dans un Widget ou l'envoyer à votre API
    }
  }

//   void AjoutMaison() async {
//   // Récupérer les valeurs des champs de texte
//   final typeMaison = _typeMaisonController.text;
//   final desc = _descController.text;
//   final adress = _adressContoller.text;
  
//   // ... récupérer les autres valeurs

//   // Créer un objet FormData pour envoyer des données (y compris des fichiers) via http
//   var request = http.MultipartRequest(
//     'POST',
//     Uri.parse(Api_url + '/homes'), // Assurez-vous que l'URL est correcte
//   );

//   // Ajouter les champs de texte à la requête
//   request.fields['typeMaison'] = typeMaison;
//   request.fields['desc'] = desc;
//   request.fields['adress'] = adress;
//   // ... ajouter les autres champs

//   // Si vous avez des images à envoyer, vous pouvez les ajouter comme suit :
//   if (_selectedImages.isNotEmpty) {
//     for (var image in _selectedImages) {
//       var stream = http.ByteStream(image.openRead());
//       var length = await image.length();
//       var multipartFile = http.MultipartFile('images', stream, length,
//           filename: image.path.split('/').last); // Utilisez le nom de fichier approprié ici

//       request.files.add(multipartFile);
//     }
//   }

//   // Envoyer la requête et attendre la réponse
//   var response = await request.send();

//   if (response.statusCode == 201) {
//     print('Maison ajoutée avec succès');
//     // Effacer les champs de texte après avoir ajouté la maison
//     _typeMaisonController.clear();
//     _descController.clear();
//     _adressContoller.clear();
//     // ... effacer les autres champs
//   } else {
//     print('Erreur lors de l\'ajout de la maison');
//   }
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: MenuWidget(
                  iconImg: Icons.arrow_back,
                  iconColor: white,
                  conBackColor: Colors.transparent,
                  onbtnTap: () {
                    Navigator.of(context).pop(false);
                  }),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Ajout de propriete',
                style: headline,
              ),
            ),

            Form(
              child: textFild(
                  controller: _typeMaisonController,
                  //image: 'user.svg',
                  keyBordType: TextInputType.name,
                  hintTxt: 'le type de la maison',
                  isNotValidate: _isNotValidate),
            ),

            //*Champ de adress
            textFild(
                controller: _descController,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'descritption',
                isNotValidate: _isNotValidate),

            //*Champ de l'address
            textFild(
                controller: _adressContoller,
                keyBordType: TextInputType.emailAddress,
                //image: 'user.svg',
                hintTxt: 'Adress de la maison',
                isNotValidate: _isNotValidate),

            //*Champ de nbre de chambre
            textFild(
                controller: _mbreChambreController,
                // image: 'user.svg',
                keyBordType: TextInputType.number,
                hintTxt: 'nombre de chambre',
                isNotValidate: _isNotValidate),

            ///*prix
            textFild(
                controller: _prixController,
                // image: 'user.svg',
                keyBordType: TextInputType.number,
                hintTxt: 'le prix par mois  ',
                isNotValidate: _isNotValidate),

            SpaceVH(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _selectImages,
              child: Text('Sélectionner des images'),
            ),

            SpaceVH(
              height: 10,
            ),

            Mainbutton(
                onTap: () {
                //  AjoutMaison();
                  print('Maison ajoutée');
                },
                text: 'Ajouter',
                btnColor: Colors.green)
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            //selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
