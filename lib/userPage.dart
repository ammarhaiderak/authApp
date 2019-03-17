
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userPage extends StatefulWidget {
 final FirebaseUser user;
  userPage(this.user) ;
  @override
  _userPageState createState() => _userPageState(user);
}


class _userPageState extends State<userPage> {
FirebaseUser user;
  _userPageState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Welcome to our App')),
      body: message(context)
    );
  }
  Widget message(BuildContext c){
    return Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Card(
        child:Center(
        child:Text(user.email+' is Logged in Successfully!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)

        )
    ),
    ],
    );
  }

}


