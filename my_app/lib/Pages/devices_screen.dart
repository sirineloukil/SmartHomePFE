import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/circular_slider.dart';
import 'package:my_app/rest_api/models/Device_model.dart';
import 'package:my_app/rest_api/repository/Device_repository.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  DeviceRepository device_repository = DeviceRepository();
  List<Device> listDevice = <Device>[];
  bool _lights = true;

  getDevices() async {
    listDevice = await device_repository.getDevices();
    setState(() {});
  }

  @override
  void initState() {
    getDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device List'),
        backgroundColor: new Color(0xffF5591F),
      ),
      body: ListView.builder(
        itemCount: listDevice.length,
        itemBuilder: (context, index) {
          Device device = listDevice[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CircularSlider(),
                  ));
            },
            child: Dismissible(
              key: Key(device.ref),
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Device'),
                        content:
                            Text('Are You Sure You Want To Delete Device?'),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                bool response = await device_repository
                                    .deleteDevice(device.idD);
                                if (response) {
                                  Navigator.pop(context, true);
                                } else {
                                  Navigator.pop(context, false);
                                }
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No '))
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.popAndPushNamed(context, 'updatedevice',
                      arguments: [device.ref]);
                }
              },
              child: ListTile(
                leading: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/graphic-card.png'),
                          fit: BoxFit.cover)),
                ),
                title: Text(device.ref),
                subtitle: Text(
                  '   ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: CupertinoSwitch(
                  value: _lights,
                  onChanged: (bool value) { setState(() { _lights = value; }); },
                ),
                onTap: () { setState(() { _lights = !_lights; }); },
                ),
              ),
            );

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.popAndPushNamed(context, 'createdevice');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
