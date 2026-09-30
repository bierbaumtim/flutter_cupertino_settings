import 'package:cupertino_ui/cupertino_ui.dart';

import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

void main() => runApp(const MyApp());

class const MyApp() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}

class const HomeScreen() extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState() extends State<HomeScreen> {
  double _slider = 0.5;
  bool _switch = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Settings'),
      ),
      child: CupertinoSettings(
        items: <Widget>[
          const CSHeader('Brightness'),
          CSWidget(
            CupertinoSlider(
              value: _slider,
              onChanged: (double value) => setState(() => _slider = value),
            ),
            style: const CSWidgetStyle(icon: Icon(CupertinoIcons.sun_max)),
          ),
          CSControl(
            nameWidget: const Text('Auto brightness'),
            contentWidget: CupertinoSwitch(
              value: _switch,
              onChanged: (bool value) => setState(() => _switch = value),
            ),
            style: const CSWidgetStyle(
              icon: Icon(CupertinoIcons.sun_max),
              addPaddingToBorder: false,
            ),
          ),
          const CSHeader('Selection'),
          CSSelection<int>(
            items: const <CSSelectionItem<int>>[
              CSSelectionItem<int>(text: 'Day mode', value: 0),
              CSSelectionItem<int>(text: 'Night mode', value: 1),
            ],
            onSelected: (int value) => setState(() => _index = value),
            currentSelection: _index,
          ),
          const CSDescription(
            'Using Night mode extends battery life on devices with OLED display',
          ),
          const CSHeader(""),
          CSControl(
            nameWidget: const Text('Loading...'),
            contentWidget: const CupertinoActivityIndicator(),
          ),
          CSButton(
            pressed: () {
              print("It works!");
            },
            child: const Text("Licenses"),
          ),
          const CSHeader(""),
          CSButton(
            pressed: () {},
            buttonType: CSButtonType.destructiveStyle,
            child: const Text("Delete all data"),
          ),
        ],
      ),
    );
  }
}
