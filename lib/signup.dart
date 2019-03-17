import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget{

  signup({Key key}) : super(key: key);
  @override
  _StatefulElementCS createState() => _StatefulElementCS();

}

class _StatefulElementCS extends State<signup>{
  TextEditingController _em= TextEditingController();
  TextEditingController _pw=TextEditingController();

  String email='';
  String password='';

  void dispose(){
    _em.dispose();
    _pw.dispose();
  }
  void setvals(){
    setState(() {
      email=_em.text;
      password=_pw.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SIGNUP'),backgroundColor: Colors.deepOrange),
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
                            child: TextField(decoration: InputDecoration(hintText: 'Email'),keyboardType: TextInputType.emailAddress,controller:_em),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 50,right: 50),
                              child:TextField(decoration: InputDecoration(hintText: 'Password'),obscureText: true, controller: _pw)
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 50,right: 50),
                              child:TextField(decoration: InputDecoration(hintText: 'Phone No'),keyboardType: TextInputType.phone)
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 50,right: 50),
                              child:TextField(decoration: InputDecoration(hintText: 'Address'),keyboardType: TextInputType.text)
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 70),
                              child:RaisedButton(
                                  onPressed: (){
                                    setvals();
                                    signup();
                                  },
                                  child:Text('REGISTER')
                              ))
                        ]
                    )

                )
              ],
            )



        )



    );

  }

  Future<void>signup() async{
  try{
    FirebaseUser user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    user.sendEmailVerification();

  }catch(e){
    showDialog(context: context,builder:(context) {
      return AlertDialog(content: Text(e.message));
    });
  }


  }

}

