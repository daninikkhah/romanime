import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/tileButton.dart';
import '../control/profile_data_provider.dart';

const String _profileUrl =
    'https://cdnb.artstation.com/p/assets/images/images/024/541/199/large/micaela-dahl-anduin-wrynn.jpg?1582745906';
const Color _appBarBackgroundColor = Color(0xFF4C086C);
const TextStyle _nameTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
const TextStyle _buttonTextStyle =
TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle _emailPasswordTextStyle = TextStyle(
  color: Color(0xFF727272),
  fontSize: 18,
);
const TextStyle _bioTextStyle =
    TextStyle(color: Color(0xFFDEDEDE), fontSize: 18);
const Color _activeSwitchColor = Color(0xFF680099);
const TextStyle _switchTextStyle =
    TextStyle(fontSize: 18, color: Color(0xFF4C086C));
const Color _buttonColor = Color(0xFF680099);
class CreateNewUserScreen extends StatefulWidget {
  const CreateNewUserScreen({Key? key}) : super(key: key);
  static const String url = '/create_new_user_screen';

  @override
  State<CreateNewUserScreen> createState() => _CreateNewUserScreenState();
}

class _CreateNewUserScreenState extends State<CreateNewUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController = TextEditingController();

  final TextEditingController _bioTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  bool _isStraight = true;
  bool _isGirl = true;

  void onSexualOrientationChange(bool newValue){
    setState((){
      _isStraight = !_isStraight;

    });

  }

  void onSexChange(bool newValue) {
    setState(() {
      _isGirl = !_isGirl;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: _appBarBackgroundColor,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Material(
                      shape: const CircleBorder(),
                      color: Colors.grey,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person),
                        iconSize: 80,
                        padding: const EdgeInsets.all(25),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       child: Container(
                    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),
                    //           // color: Colors.grey,
                    //         ),
                    //         height: 150, width: 150,
                    //
                    //         child:  const Icon(
                    //           Icons.add,
                    //           size: 60,
                    //           // color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(_profileUrl),
                    //   radius: 70,
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nameTextController,
                      autofocus: true,
                      style: _nameTextStyle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'please enter your name',
                          hintStyle: _nameTextStyle,
                          constraints: BoxConstraints(maxWidth: _width / 1.5),
                          border: InputBorder.none),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _bioTextController,
                      style: _bioTextStyle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'please write your bio',
                          hintStyle: _bioTextStyle,
                          constraints: BoxConstraints(maxWidth: _width / 1.5),
                          border: InputBorder.none),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 50,
                          color: _appBarBackgroundColor,
                        ),
                      ),
                      SizedBox(
                        width: _width - 70,
                        child: TextFormField(
                          controller: _emailTextController,
                          style: _emailPasswordTextStyle,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'please enter your email',
                              hintStyle: _emailPasswordTextStyle,
                              constraints:
                                  BoxConstraints(maxWidth: _width / 1.5),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.key_outlined,
                          size: 50,
                          color: _appBarBackgroundColor,
                        ),
                      ),
                      SizedBox(
                        width: _width - 70,
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordTextController,
                          style: _emailPasswordTextStyle,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'please enter your password',
                              hintStyle: _emailPasswordTextStyle,
                              constraints:
                                  BoxConstraints(maxWidth: _width / 1.5),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2),

                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Text(
                        _isStraight ? 'Straight' : 'LGBTQ+',
                        style: _switchTextStyle,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 80,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: _isStraight,
                            onChanged: onSexualOrientationChange,
                            activeColor: _activeSwitchColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  if(_isStraight)
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Text(
                        _isGirl ? 'Girl' : 'Boy',
                        style: _switchTextStyle,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 80,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: _isGirl,
                            onChanged: onSexChange,
                            activeColor: _activeSwitchColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      // Provider.of<ProfileDataProvider>(context,listen: false).setProfileDate(_nameTextController.text, _bioTextController.text, _emailTextController.text, _passwordTextController.text);
                    },
                    child: const Text('submit',style: _buttonTextStyle,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(_buttonColor),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 16, horizontal: 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(const  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))))
                    ),
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
