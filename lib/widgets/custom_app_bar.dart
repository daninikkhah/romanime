import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xFFAB3DDF);
const Color _secondaryColor = Color.fromRGBO(124, 17, 174,59);//TODO check the alpha


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
 const CustomAppBar({required this.child,Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

 final Widget child;

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        child: SafeArea(child: widget.child),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_primaryColor, _secondaryColor])),
      ),
    );
  }
}


