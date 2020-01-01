import 'package:flutter/material.dart';
import 'package:w_store_flutter/src/login/models/login_model.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formkey = GlobalKey<FormState>();
  LoginModel _formData = LoginModel();
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
      return '请输入用户名。';
    }

    return null;
  }

  String _validatePassword(String value) {
    if(value.isEmpty) {
      return '请输入密码。';
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
                '登录',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.0,
                ),
              ),

              onPressed: _submitForm,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.white12,
              padding: EdgeInsets.all(16.0),
              elevation: 0.0,
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              child: Text(
                '注册新账号',
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
















