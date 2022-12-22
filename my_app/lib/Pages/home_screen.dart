import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/Pages/drawer_bar.dart';
import 'package:my_app/Pages/zones_screen.dart';
import 'package:my_app/rest_api/models/Home_model.dart';
import 'package:my_app/rest_api/repository/Home_repository.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeRepository home_repository = HomeRepository();
    List<Home> listHome = <Home>[];


    getHomes() async {
      listHome = await home_repository.getHomes();
      setState(() {});
    }

    @override
    void initState() {
      getHomes();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          backgroundColor: new Color(0xffF5591F),
        ), drawer: DrawerBar(),
        body: ListView.builder(
          itemCount: listHome.length,
          itemBuilder: (context, index) {
           Home home = listHome[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ZonesScreen(),
                    ));
              },
              child: Dismissible(
                key: Key(home.label),
                background: slideRightBackground(),
                secondaryBackground: slideLeftBackground(),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete Home'),
                          content:
                          Text('Are You Sure You Want To Delete Home?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  bool response = await home_repository
                                      .deleteHome(home.idShFab);
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
                    Navigator.popAndPushNamed(context, 'updatehome',
                        arguments: [home.label,home.dateFab,home.dateOeuvre,home.location,home.verSoft,home.zones]);
                  }
                },
                child: ListTile(
                  leading: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/cpu.png'),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(home.label),
                  subtitle: Text(
                    home.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: TextButton(
                      child: const Text('Generate Pairing Code', style: TextStyle(color: Colors.deepOrangeAccent),),
                      onPressed: (() {
                        var random;
                        random = generateRandomString(16);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 3000),
                          content: Text('$random'),
                        ));
                      })),
                ),
              ),
            );

          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () {
            Navigator.popAndPushNamed(context, 'createhome');
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
String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}