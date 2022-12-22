import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/settingsdirectory/Language.dart';
import 'package:my_app/settingsdirectory/language_constants.dart';
import 'package:my_app/settingsdirectory/theme_notifier.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _themeNotifier = ThemeNotifier();
  @override
  void initState() {
    super.initState();

    _themeNotifier.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      body: Column(
        children: const <Widget>[

          LanguageCard(),
                  ],
      ),
    );
      }
}
class DarkThemeCard extends StatefulWidget {
  const DarkThemeCard({Key? key}) : super(key: key);

  @override
  State<DarkThemeCard> createState() => _DarkThemeCardState();
}

class _DarkThemeCardState extends State<DarkThemeCard> {
  final _themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          leading: Text('   '),
          title: Text('Dark Theme'),
          subtitle: Text('   '),
          trailing: CupertinoSwitch(
            activeColor: Colors.orangeAccent,
            value: _themeNotifier.currentTheme() == ThemeMode.dark,
            onChanged: (_) {
              setState(() {
                _themeNotifier.switchTheme();
              });
            },

          ),
        ),
      ),);
  }
}

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButton<Language>(
          iconSize: 30,
          hint: Text(translation(context).changeLanguage),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
              .toList(),
        )
    );
  }
}
