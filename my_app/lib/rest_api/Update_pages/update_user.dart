import 'package:flutter/material.dart';
import 'package:my_app/rest_api/repository/User_repository.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  UserRepository user_repository= UserRepository();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final roleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?. settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      nameController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      lastNameController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      emailController.text = args[3];
    }
    if (args[4].isNotEmpty) {
      addressController.text = args[4];
    }
    if (args[5].isNotEmpty) {
      roleController.text = args[5];
    }
    return Scaffold(
      appBar: AppBar(title: Text('Update A User'),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: 'Address'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: roleController,
              decoration: InputDecoration(hintText: 'Role'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:   MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
              bool response = await user_repository.updateUser(args[0],nameController.text,lastNameController.text,
                  emailController.text, addressController.text, roleController.text);
              if (response ) {
                Navigator.popAndPushNamed(context, 'user_view');
              }else{
                throw Exception('Failed to update User');
              }
            }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
