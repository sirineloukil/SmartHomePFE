import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/Device_repository.dart';
class UpdateDevice extends StatefulWidget {
  const UpdateDevice({Key? key}) : super(key: key);

  @override
  State<UpdateDevice> createState() => _UpdateDeviceState();
}

class _UpdateDeviceState extends State<UpdateDevice> {
  DeviceRepository device_repository= DeviceRepository();
  final refController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?. settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      refController.text = args[1];
    }
       return Scaffold(
      appBar: AppBar(title: Text('Update A Device'),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: refController,
              decoration: InputDecoration(hintText: 'Label'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
              ),
              onPressed: () async {

              bool response = await device_repository.updateDevice(args[0],refController.text);
              if (response ) {
                Navigator.popAndPushNamed(context, 'device_view');
              }else{
                throw Exception('Failed to update Device');
              }
            }, child: Text('Update'),),
          ],
        ),
      ),
    );
  }
}