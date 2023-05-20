import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/BobsFile.dart';
import '../widgets/in_action_options.dart';
import 'package:google_fonts/google_fonts.dart';
import '../control/date_screen_statemanagement.dart';

class DateScreen extends StatelessWidget {
  static const String route = 'dateScreen';

  const DateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => DateScreenStateManagement(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Image.asset(
              'lib/assets/date_background.png',
              fit: BoxFit.cover,
              height: _height,
            ),
            Positioned(
              bottom: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: _width * 0.9, maxHeight: _height * 0.4),
                      child: const InActionOptions(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    width: _width,
                    color: const Color.fromRGBO(65, 0, 96, 0.69),
                    child: Consumer<DateScreenStateManagement>(
                      builder: (context, dateScreenData, _) {
                        final List<String> _conversations = dateScreenData.currentTalk.conversations;
                        return ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: _width * 0.9, maxHeight: _height * 0.2),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            shrinkWrap: true,
                              itemCount: _conversations.length,
                              itemBuilder: (context, index) =>
                                  Text(
                                    _conversations[index],
                                    style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        fontSize: 22,
                                        height: 1.25),
                                    textAlign: TextAlign.center,
                                  )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
