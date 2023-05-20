import 'package:flutter/material.dart';
import 'in_action_option_button.dart';
import '../control/date_screen_statemanagement.dart';
import 'package:provider/provider.dart';
import '../control/BobsFile_outdated.dart';

class InActionOptions extends StatelessWidget {
  const InActionOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DateScreenStateManagement>(
      builder: (context, dateScreenData, _) {
        final List<Option> _options = dateScreenData.currentTalk.options;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _options.length,
          itemBuilder: (context, index) => InActionOptionButton(
            text: _options[index].text,
            position: index == 0
                ? _options.length == 1 ? ButtonPosition.only :
            ButtonPosition.start
                : index == _options.length -1
                    ? ButtonPosition.end
                    : ButtonPosition.middle,
            onPressed: () {
              dateScreenData.changeTalk(_options[index].next);
            },
          ),
        );
      },
    );
  }
}
