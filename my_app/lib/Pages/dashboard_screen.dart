import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/drawer_bar.dart';
import 'package:my_app/Pages/zones_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: new Color(0xffF5591F),
      ),
      drawer: DrawerBar(),
      body: Card(
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: () {
            debugPrint('Card tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Image(
                    image: AssetImage(
                  "assets/images/cpu.png",
                )),
                title: Text(
                  'Centrale Principale',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Location: Sfax, Tunisie'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text('Manage Zones', style: TextStyle(color: Colors.deepOrangeAccent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ZonesScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                      child: const Text('Generate Pairing Code', style: TextStyle(color: Colors.deepOrangeAccent),),
                      onPressed: (() {
                        var random;
                        random = generateRandomString(16);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 3000),
                          content: Text('$random'),
                        ));
                      })),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          print("fab clicked");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
