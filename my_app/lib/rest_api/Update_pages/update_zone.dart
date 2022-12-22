import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Zone_repository.dart';
class UpdateZone extends StatefulWidget {
  const UpdateZone({Key? key}) : super(key: key);

  @override
  State<UpdateZone> createState() => _UpdateZoneState();
}

class _UpdateZoneState extends State<UpdateZone> {
  ZoneRepository zone_repository= ZoneRepository();
  final labelController = TextEditingController();
  final devicesController = TextEditingController();
  final pairingsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?. settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      labelController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      devicesController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      pairingsController.text = args[3];
    }
    return Scaffold(
      appBar: AppBar(title: Text('Update A Zone'),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(hintText: 'Label'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: devicesController,
              decoration: InputDecoration(hintText: 'Devices'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: pairingsController,
              decoration: InputDecoration(hintText: 'Pairings'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
              bool response = await zone_repository.updateZone(args[0],labelController.text,devicesController.text,
                  pairingsController.text);
              if (response ) {
                Navigator.popAndPushNamed(context, 'zone_view');
              }else{
                throw Exception('Failed to update Zone');
              }
            }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
