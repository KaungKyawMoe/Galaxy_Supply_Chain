import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/UserDto.dart';
import 'package:flutter_app/Providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePwd = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        //color: Theme.of(context).primaryColor,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Galaxy Supply Chain',
                style:TextStyle(
                  fontSize: 24,
                ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            /*
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text("UserName",
              style:TextStyle(
                fontSize: 16,
              )),
            ),
            */

            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: "Username",
                contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
                suffixIcon: Icon(Icons.person),
                hintText: 'johndoe@ie.com',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                  )
                )
              ),
              style: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.black
              ),
            ),

            SizedBox(height: 15,),

            /*
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Password",
                  style:TextStyle(
                    fontSize: 16,
                  )),
            ),
            */

            TextField(
              controller: passwordController,
              obscureText: hidePwd,
              decoration: InputDecoration(
                labelText: "Password",
                focusColor: Theme.of(context).highlightColor,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState((){
                      hidePwd = !hidePwd;
                      loading = false;
                    });
                  },
                  icon:Icon(hidePwd ? Icons.lock : Icons.lock_open),),
                hintText: '****',
                //fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),
              ),
              style: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.black
              ),
            ),

            SizedBox(height: 15,),

            InkWell(
              focusColor: Theme.of(context).focusColor,
              onTap: (){
                setState((){
                  loading = true;

                  UserDto userDto = UserDto();
                  userDto.name = userNameController.text.toString();
                  userDto.password = passwordController.text.toString();
                  Provider.of<UserProvider>(context,listen:false).Login(userDto).then(
                          (value) {
                            if(value){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
                            }
                            else{
                              loading = false;
                            }
                          }
                  );
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: Border.all(color: Theme.of(context).highlightColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: double.infinity,
                child:loading ? Center(
                  heightFactor: 0.65,
                    child: CircularProgressIndicator()) :
                Text(
                  "LOGIN",
                  style:TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
