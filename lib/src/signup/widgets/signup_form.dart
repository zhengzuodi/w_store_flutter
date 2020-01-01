import 'package:flutter/material.dart';
import 'package:w_store_flutter/src/signup/models/signup_model.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  final _formkey = GlobalKey<FormState>();
  SignupModel _formData = SignupModel();
  bool _autovalidate = false;


  void _submitForm() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print('Name: ${_formData.name}');
      print('Password: ${_formData.password}');
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String _validateName(String value) {
    if(value.isEmpty) {
      return '请输入注册用户名';
    }

    return null;
  }

  String _validatePassword(String value) {
    if(value.isEmpty) {
      return '请输入注册密码';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[

          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '输入登录用户名',
              helperText: '',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white38,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white70,
                ),
              ),

              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white70,
                ),
              ),
            ),

            onSaved: (String value) {
              _formData.name = value;
            },
            autovalidate: _autovalidate,
            validator: _validateName,
          ),

          SizedBox(
            height: 20.0,
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '输入登录密码',
              helperText: '',
              labelStyle: TextStyle(
                color: Colors.white,
              ),

              hintStyle: TextStyle(
                color: Colors.white38,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white70,
                ),
              ),

              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white70,
                ),
              ),
            ),

            obscureText: true,

            onSaved: (String value){
              _formData.password = value;
            },

            autovalidate: _autovalidate,
            validator: _validatePassword,
          ),

          Container(
            padding: EdgeInsets.only(
              top: 32.0,
            ),
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                '注册新帐户',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),

              onPressed: _submitForm,
              color: Colors.white,
              splashColor: Colors.white70,
              padding: EdgeInsets.all(16.0),
              elevation: 0.0,
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              child: Text(
                '已有账号，点击登录 ->',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
















