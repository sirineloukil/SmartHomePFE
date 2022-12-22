import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Home_repository.dart';
import 'package:my_app/services/local_notification_service.dart';
class CreateHome extends StatefulWidget {
  const CreateHome({Key? key}) : super(key: key);

  @override
  State<CreateHome> createState() => _CreateHomeState();
}

class _CreateHomeState extends State<CreateHome> {
  HomeRepository home_repository= HomeRepository();
  final verHardController = TextEditingController();
  final verSoftController = TextEditingController();
  final dateFabController = TextEditingController();
  final dateOeuvreController = TextEditingController();
  final zonesController = TextEditingController();
  final labelController = TextEditingController();
  final locationController = TextEditingController();
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create A New Home'), backgroundColor: new Color(0xffF5591F),),
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
                  bool response = await home_repository.createHome(verHardController.text,verSoftController.text,
                      dateFabController.text, dateOeuvreController.text, zonesController.text,labelController.text,locationController.text);
                  if (response ) {
                    await service.showNotification(
                        id: 0, title: 'Domi', body: 'Home Added');
                    Navigator.popAndPushNamed(context, 'home_view');
                  }else{
                    throw Exception('Failed to create Home');
                  }
                }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
