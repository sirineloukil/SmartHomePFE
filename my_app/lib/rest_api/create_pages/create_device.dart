import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Device_repository.dart';
import 'package:my_app/services/local_notification_service.dart';

class CreateDevice extends StatefulWidget {
  const CreateDevice({Key? key}) : super(key: key);

  @override
  State<CreateDevice> createState() => _CreateDeviceState();
}

class _CreateDeviceState extends State<CreateDevice> {
  DeviceRepository device_repository = DeviceRepository();
  final refController = TextEditingController();
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
        backgroundColor: new Color(0xffF5591F),
        title: Text('Create A New Device'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: refController,
              decoration: InputDecoration(hintText: 'Label'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  bool response =
                      await device_repository.createDevice(refController.text);
                  if (response) {
                    await service.showNotification(
                        id: 0, title: 'Domi', body: 'Device Added');
                    Navigator.popAndPushNamed(context, 'device_view');
                  } else {
                    throw Exception('Failed to create Device');
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
