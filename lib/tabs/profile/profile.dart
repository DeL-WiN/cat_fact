import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/details/details.dart';
import 'controllers/login_controler.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: loginUI(),
    );
  }

  loginUI() {

    return Consumer<LoginController> (
        builder: (context, model, child) {
          if(model.userDetalils != null) {
            return Center(
              child: loggedInUI(model),
            );
          }else {
            return cash();
          }
        }
    );
  }

  cash() {

    return Consumer<LoginController> (
        builder: (context, model, child) {
          var userCash = model.userP.user?.loadCash();
          if(userCash != null) {
            return Center(
              child: loggedInUI(model),
            );
          }else {
            return loginControllers(context);
          }
        }
    );
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetalils!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.userDetalils!.displaiyName ?? ''),
        Text(model.userDetalils!.email ?? ''),

        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            }
        ),
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('assets/images/google.jpg',
              width: 240,),
            onTap: () {
              Provider.of<LoginController>(context, listen: false).googleLogin();
            },
          ),
          SizedBox(height: 10,),
          GestureDetector(
            child: Image.asset('assets/images/fb.jpg',
              width: 240,),
            onTap: () {
              Provider.of<LoginController>(context, listen: false).facebooklogin();
            },
          ),
        ],
      ),
    );
  }
}
