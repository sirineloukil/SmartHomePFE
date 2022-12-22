import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Home_repository.dart';
class UpdateHome extends StatefulWidget {
  const UpdateHome({Key? key}) : super(key: key);

  @override
  State<UpdateHome> createState() => _UpdateHomeState();
}

class _UpdateHomeState extends State<UpdateHome> {
  HomeRepository home_repository= HomeRepository();
  final verHardController = TextEditingController();
  final verSoftController = TextEditingController();
  final dateFabController = TextEditingController();
  final dateOeuvreController = TextEditingController();
  final zonesController = TextEditingController();
  final labelController = TextEditingController();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?. settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      verHardController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      verSoftController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      dateFabController.text = args[3];
    }
    if (args[4].isNotEmpty) {
      dateOeuvreController.text = args[4];
    }
    if (args[5].isNotEmpty) {
      zonesController.text = args[5];
    }
    if (args[6].isNotEmpty) {
      labelController.text = args[6];
    }
    if (args[7].isNotEmpty) {
      locationController.text = args[7];
    }
    return Scaffold(
      appBar: AppBar(title: Text('Update A User'), backgroundColor: new Color(0xffF5591F),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: verHardController,
              decoration: InputDecoration(hintText: 'verHard'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller:verSoftController,
              decoration: InputDecoration(hintText: 'verSoft'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: dateFabController,
              decoration: InputDecoration(hintText: 'dateFab'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: dateOeuvreController,
              decoration: InputDecoration(hintText: 'dateOeuvre'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: zonesController,
              decoration: InputDecoration(hintText: 'zones'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: labelController,
              decoration: InputDecoration(hintText: 'label'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: locationController,
              decoration: InputDecoration(hintText: 'Location'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  bool response = await home_repository.updateHome(args[0],verHardController.text,verSoftController.text,
                      dateFabController.text, dateOeuvreController.text, zonesController.text,labelController.text,locationController.text);
                  if (response ) {
                    Navigator.popAndPushNamed(context, 'home_view');
                  }else{
                    throw Exception('Failed to update Home');
                  }
                }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
