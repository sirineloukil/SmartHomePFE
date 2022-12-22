import 'package:flutter/material.dart';

import '../rest_api/models/User_model.dart';
import '../rest_api/repository/User_repository.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserRepository repository = UserRepository();
  List<User> listUser = <User>[];

  getUsers() async {
    listUser = await repository.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('User List'),
        backgroundColor: new Color(0xffF5591F),),
      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          User user = listUser[index];
          return InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, 'updateuser', arguments: [
                user.idUser,
                user.name,
                user.lastname,
                user.email,
                user.address,
                user.role
              ]);
            },
            child: Dismissible(
              key: Key(user.name),
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete User'),
                        content: Text('Are You Sure You Want To Delete User?'),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                bool response =
                                    await repository.deleteUser(user.idUser);
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
                  Navigator.popAndPushNamed(context, 'updateuser', arguments: [
                    user.name,
                    user.lastname,
                    user.email,
                    user.address,
                    user.role
                  ]);
                }
              },
              child: ListTile(
                leading: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                          fit: BoxFit.cover)),
                ),
                title: Text('${user.name}  ${user.lastname}'),
                subtitle: Text(
                  '${user.email}',
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
          Navigator.popAndPushNamed(context, 'createuser');
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
