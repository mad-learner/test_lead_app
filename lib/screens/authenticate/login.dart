import 'package:flutter/material.dart';
//import 'package:lead_india_nm/screens/HomePage.dart';
import 'package:lead_india_nm/services/auth.dart';
import 'package:lead_india_nm/shared/loading.dart';

class LogIn extends StatefulWidget {

  final Function toggleView;
  LogIn({ this.toggleView });

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  // void validateAndSave(){
  //   final form = formKey.currentState;
  //   if (form.validate()){
  //     form.save();
  //     print('Form is valid. Email: $_email, Password: $_password');
  //   }else
  //   {
  //     print('Form is invalid. Email: $_email, Password: $_password');
  //   }
  // }

  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Login.jpg'), 
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.email, color: Colors.green,),
                        labelText: 'Enter Email Id', 
                      ),
                        validator: (value) => value.isEmpty ? 'Enter an Email' : null,
                        // onSaved: (value) => email = value,
                    ),
                    SizedBox(height: 0.0),
                    TextFormField(
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_open, color: Colors.green, ),
                        labelText: 'Password',
                      ),
                        obscureText: true,
                        validator: (value) => value.length < 6 ? 'Enter a Password 6+ chars long' : null,
                        // onSaved: (value) => password = value,
                    ),
                    SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        setState(() => loading = true);
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if(result == null)
                          {
                            setState(() {
                              error = 'could not sign in with those credentials';
                              loading = false;
                            });
                          } 
                        }

                        // dynamic result = await _auth.signInAnon();
                        // if (result == null)
                        // {
                        //   print('Error Signing In');
                        // } else {
                        //   print('Signed In');
                        //   print(result);
                        // }

                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => HomePage()),);
                      },
                      child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.green,
                        padding: const EdgeInsets.all(1.0),
                    ),
                    SizedBox(height: 0.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Have an Account ?', 
                            style: TextStyle(fontSize: 10),
                          ),
                          FlatButton(
                            onPressed: () {
                              widget.toggleView();
                            }, 
                            child: Text('Register', style: TextStyle(color: Colors.green),),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}