import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../control/datasource/player_profile_data_source.dart';
import '../control/state_management/data_manager.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _bIsLogin = false;
  String _email =
      ''; //TODO check for potential problems because of initiating variable with ' instead of being null
  String _password =
      ''; //TODO check for potential problems because of initiating variable with ' instead of being null
  String _name =
      ''; //TODO check for potential problems because of initiating variable with ' instead of being null

  void _changeFormType() => setState(() => _bIsLogin = !_bIsLogin);

  void _submit() {
    //TODO validate data
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      _formKey.currentState!.save();
    } //TODO check this shit
    _bIsLogin
        ? PlayerProfileDataSource.createNewAccount(_name, _email, _password)
        : _auth.signInWithEmailAndPassword(email: _email, password: _password);
    DataManager.initialise(context);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              //TODO add validation
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _email = value ?? '',
                  ),
                  if (_bIsLogin)
                    TextFormField(
                      key: UniqueKey(), //TODO check if it works properly
                      decoration: const InputDecoration(labelText: 'name'),
                      onSaved: (value) => _name = value ?? '',
                    ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'password'),
                    obscureText: true,
                    onSaved: (value) => _password = value ?? '',
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: _changeFormType,
                          child: Text(_bIsLogin
                              ? 'already have an account'
                              : 'create a new account')),
                      Expanded(child: Container()),
                      ElevatedButton(
                          onPressed: _submit,
                          child: Text(_bIsLogin ? 'login' : 'sign in')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
