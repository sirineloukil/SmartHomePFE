import 'package:flutter/material.dart';
import 'package:my_app/Pages/drawer_item.dart';
import 'package:my_app/Pages/login_screen.dart';
import 'package:my_app/drawer_pages/Settings.dart';
import 'package:my_app/drawer_pages/User_View.dart';
import 'package:my_app/drawer_pages/consommation.dart';


class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 60, 20, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Users List',
                icon: Icons.people,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Settings',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Version          1.0.0',
                  icon: Icons.note,
                  onPressed: ()=> onItemPressed(context, index: 4)

              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserView()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Consommation(title: 'Monthly consumption ')));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
    }
  }

  Widget headerWidget() {
       return Row(
      children: [
       Image.asset("assets/images/user_drawer.png",height: 60.0,width: 60.0,),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Khaled Baklouti', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('khaledbaklouti@gmail.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}