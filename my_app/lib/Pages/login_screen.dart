import 'package:flutter/material.dart';
import 'package:my_app/Pages/dashboard_screen.dart';
import 'package:my_app/Pages/home_screen.dart';
import 'package:my_app/services/local_notification_service.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  bool _isObscure = true;
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: new Color(0xffF5591F),
                    gradient: LinearGradient(
                      colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Image.asset(
                              'assets/images/smarthome.png',
                              width: 200,
                              height: 150,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Log In",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextField(
                    cursorColor: Color(0xffF5591F),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffEEEEEE),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextField(
                    obscureText: _isObscure,
                    cursorColor: Color(0xffF5591F),
                    decoration: InputDecoration(
                      focusColor: Color(0xffF5591F),
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      print('Option not available for now');
                    },
                    child: Text("Forget Password?"),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await service.showNotification(
                        id: 0,
                        title: 'Domi',
                        body: 'Log In With Success');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>  HomeScreen(),));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )));
  }
}
