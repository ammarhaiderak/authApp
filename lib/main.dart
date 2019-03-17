import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userPage.dart';


void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sample App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SampleAppPage(),
        routes: <String, WidgetBuilder> {
          '/l': (BuildContext context) => login(),
          '/s': (BuildContext context) => signup(),
        }
    );
  }
}
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}


class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Center(
                child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(onPressed: (){
                      setState(() {
                        Navigator.of(context).pushNamed('/s');
                      });

                    },child:Text('SIGN UP')),

                    RaisedButton(onPressed: (){
                      setState(() {
                        Navigator.of(context).pushNamed('/l');
                      });

                    },child:Text('SIGNIN')),

                  ],
                ))

    );
  }
}
