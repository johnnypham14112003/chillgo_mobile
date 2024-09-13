import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chillgo_mobile/enviroment_vars/colors_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SwitchListTile(
                title: Provider.of<ThemeColorData>(context).isDark
                    ? Text("Dark Theme On",
                        style: Theme.of(context).textTheme.titleMedium)
                    : Text("Dark Theme Off",
                        style: Theme.of(context).textTheme.titleMedium),
                onChanged: (bool newValue) {
                  Provider.of<ThemeColorData>(context, listen: false)
                      .toggleTheme();
                },
                value: Provider.of<ThemeColorData>(context).isDark,
              )
            ],
          )),
    );
  }
}
