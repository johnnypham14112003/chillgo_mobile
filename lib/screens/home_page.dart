import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chillgo_mobile/enviroment_vars/colors_theme.dart';
import 'package:chillgo_mobile/screens/profile_page.dart';
import 'package:chillgo_mobile/screens/authentication_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: const Text('Go to Settings'),
        ),
        Padding(
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
      ]),

      // body: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         SwitchListTile(
      //           title: Provider.of<ThemeColorData>(context).isDark
      //               ? Text("Dark Theme On",
      //                   style: Theme.of(context).textTheme.titleMedium)
      //               : Text("Dark Theme Off",
      //                   style: Theme.of(context).textTheme.titleMedium),
      //           onChanged: (bool newValue) {
      //             Provider.of<ThemeColorData>(context, listen: false)
      //                 .toggleTheme();
      //           },
      //           value: Provider.of<ThemeColorData>(context).isDark,
      //         )
      //       ],
      //     )),
    );
  }
}
