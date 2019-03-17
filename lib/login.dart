import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userPage.dart';

class login extends StatefulWidget{

  login({Key key}) : super(key: key);

  @override
  _StatefulElementC createState() => _StatefulElementC();
}

class _StatefulElementC extends State<login>{

  String _username;//='default';
  String _password;//='default';

  final unController = new TextEditingController();
  final pwController =new TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    unController.dispose();
    pwController.dispose();
    super.dispose();
  }
  void setvals(){
    setState(() {
      _username=unController.text;
      _password=pwController.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LOGIN'),backgroundColor: Colors.deepOrange),
        body:
        Center(
            child:
            Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10.0),
                    child:
                    Column(
                        children:<Widget>[
                          Card(
                            child: Image.asset('assets/download.jpg'),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50,right: 50,top:100),
                            child:TextField(
                              decoration: InputDecoration(
                                  hintText: 'User_Name'),
                              keyboardType: TextInputType.emailAddress,
                              /*onChanged: (String x){setState(() {
                                _username=x;
                              });}*/
                              controller: unController,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 50,right: 50),
                              child:TextField(
                                decoration: InputDecoration(
                                    hintText: 'Password'),
                                obscureText: true,
                                /*onChanged: (String x){setState(() {
                                    _password=x;
                                  });}*/
                                controller: pwController,
                              )

                          ),
                          Container(
                              padding: EdgeInsets.only(top: 70),
                              child:RaisedButton(
                                  onPressed: () {
                                   setvals();
                                    signin();
                                  }
                                  /*(){
                                    showDialog(context: context,builder: (context) {
                                      return AlertDialog(
                                        // Retrieve the text the user has typed in using our
                                        // TextEditingController
                                        content: Text(unController.text+'\n'+pwController.text),
                                      );
                                    });
                                  }*/
                                  ,child:Text('Sign in')
                              ))
                          //,Text('BY_ONCHANGED!'+_username+'\n'+_password)
                          // ,Text('BY_CONTROLLER'+myController.text)
                        ]
                    )
                )
              ],
            )



        )



    );

  }

  Future<void> signin() async{
    try{
     // showDialog(context: context,builder:(context) {return AlertDialog(content: Text(_username));});
      FirebaseUser user=await FirebaseAuth.
      instance.
      signInWithEmailAndPassword(
          email: _username, password: _password);
         // Navigator.pushNamed(,'/up');
          Navigator.push(context,MaterialPageRoute(builder: (context)=>userPage(user)));
        //showDialog(context: context,builder:(context) {return AlertDialog(content: Text(user.email));});
    }catch(e){
      print(e.message);
     // showDialog(context: context,builder:(context) {return AlertDialog(content: Text(e.message));});
    }


  }
}

