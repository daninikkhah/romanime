import 'package:flutter/material.dart';

const Color color = Color(0xFF4C086C);


class TileButton extends StatelessWidget {
  const TileButton.TextFieldTile({Key? key, required this.setValue,required this.title,required this.icon}) : super(key: key);
  final String title;
  final IconData icon;
  final Function()? setValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: null,
          contentPadding: const EdgeInsets.only(
              top: 15, bottom: 10, left: 16, right: 16),
          leading: Icon(
            icon,
            color: color,
            size: 40,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: color),
            ),
          ),
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   color: color,
          //   size: 40,
          // ),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
