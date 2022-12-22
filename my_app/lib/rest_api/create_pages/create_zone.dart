import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Zone_repository.dart';
import 'package:my_app/services/local_notification_service.dart';

class CreateZone extends StatefulWidget {
  const CreateZone({Key? key}) : super(key: key);

  @override
  State<CreateZone> createState() => _CreateZoneState();
}

class _CreateZoneState extends State<CreateZone> {
  ZoneRepository zone_repository = ZoneRepository();
  final labelController = TextEditingController();
  final devicesController = TextEditingController();
  final pairingsController = TextEditingController();
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
      appBar: AppBar(
          title: Text('Create A New Zone'),
          backgroundColor: new Color(0xffF5591F)),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(hintText: 'Label'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: devicesController,
              decoration: InputDecoration(hintText: 'Devices'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: pairingsController,
              decoration: InputDecoration(hintText: 'Pairings'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  bool response = await zone_repository.createZone(
                      labelController.text,
                      devicesController.text,
                      pairingsController.text);
                  if (response) {
                    await service.showNotification(
                        id: 0, title: 'Domi', body: 'Zone Added');
                    Navigator.popAndPushNamed(context, 'zone_view');
                  } else {
                    throw Exception('Failed to create Zone');
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
