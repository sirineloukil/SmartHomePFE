import 'package:flutter/material.dart';
import 'package:my_app/Pages/devices_screen.dart';
import 'package:my_app/rest_api/models/Zone_model.dart';
import 'package:my_app/rest_api/repository/Zone_repository.dart';

class ZonesScreen extends StatefulWidget {
  const ZonesScreen({Key? key}) : super(key: key);

  @override
  State<ZonesScreen> createState() => _ZonesScreenState();
}

class _ZonesScreenState extends State<ZonesScreen> {
  ZoneRepository zone_repository = ZoneRepository();
  List<Zone> listZone = <Zone>[];

  getZones() async {
    listZone = await zone_repository.getZones();
    setState(() {});
  }

  @override
  void initState() {
    getZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Zone List'), backgroundColor: new Color(0xffF5591F)),
      body: ListView.builder(
        itemCount: listZone.length,
        itemBuilder: (context, index) {
          Zone zone = listZone[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DevicesScreen(),
                  ));
            },
            child: Dismissible(
              key: Key(zone.label),
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Zone'),
                        content: Text('Are You Sure You Want To Delete Zone?'),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                bool response =
                                    await zone_repository.deleteZone(zone.idZ);
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
                  Navigator.popAndPushNamed(context, 'updatezone',
                      arguments: [zone.label, zone.devices, zone.pairings]);
                }
              },
              child: ListTile(
                leading: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/icons8-living-room-64.png'),
                          fit: BoxFit.cover)),
                ),
                title: Text('${zone.label}  '),
                subtitle: Text(
                  'Owner',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.popAndPushNamed(context, 'createzone');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
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
    color: Colors.blue,
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
