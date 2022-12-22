import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/User_repository.dart';
import 'package:my_app/services/local_notification_service.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  UserRepository user_repository = UserRepository();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final roleController = TextEditingController();
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
          title: Text('Create A New User'),
          backgroundColor: new Color(0xffF5591F)),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: 'Address'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(hintText: 'Role'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  bool response = await user_repository.createUser(
                      nameController.text,
                      lastNameController.text,
                      emailController.text,
                      addressController.text,
                      roleController.text);
                  if (response) {
                    await service.showNotification(
                        id: 0, title: 'Domi', body: 'User Added');
                    Navigator.popAndPushNamed(context, 'user_view');
                  } else {
                    throw Exception('Failed to create User');
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
