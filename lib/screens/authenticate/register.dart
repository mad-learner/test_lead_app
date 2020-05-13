import 'package:flutter/material.dart';
import 'package:lead_india_nm/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    // SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if(result == null)
                          {
                            setState(() => error = 'please enter a valid email');
                          } 
                        }
                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => HomePage()),);
                      },
                      child: Text('Register', style: TextStyle(fontSize: 18, color: Colors.white),),
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
                            'Already Have an Account ?', 
                            style: TextStyle(fontSize: 10),
                          ),
                          FlatButton(
                            onPressed: () {
                              widget.toggleView();
                            }, 
                            child: Text('LogIn', style: TextStyle(color: Colors.green),),
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