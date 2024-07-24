import 'package:app_theme/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return ListView(
            children: _themeList(context, theme, child),
          );
        },
      ),
    );
  }

  List<Widget> _themeList(
      BuildContext context, ThemeProvider theme, Widget? child) {
    if (theme.themeMode == ThemeMode.system) {
      return [
        _followSystem(context, theme),
      ];
    }
    return [
      _followSystem(context, theme),
      const SizedBox(height: 8),
      const Text('手动选择').fontSize(14).textColor(Colors.grey).padding(left: 18),
      _light(context, theme),
      _dark(context, theme),
    ];
  }

  ListTile _followSystem(BuildContext context, ThemeProvider theme) {
    return ListTile(
      title: const Text('跟随系统').fontSize(18),
      subtitle:
          const Text('开启后, 将跟随系统打开或关闭深色模式').fontSize(14).textColor(Colors.grey),
      trailing: CupertinoSwitch(
        value: theme.themeMode == ThemeMode.system,
        onChanged: (value) {
          theme.changeTheme(value ? ThemeMode.system : ThemeMode.light);
        },
      ),
    );
  }

  ListTile _light(BuildContext context, ThemeProvider theme) {
    return ListTile(
      title: const Text('普通模式').fontSize(18),
      trailing: Icon(
        Icons.check,
        color: theme.themeMode == ThemeMode.light
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.inversePrimary,
      ),
      onTap: () {
        theme.changeTheme(ThemeMode.light);
      },
    );
  }

  ListTile _dark(BuildContext context, ThemeProvider theme) {
    return ListTile(
      title: const Text('暗色模式').fontSize(18),
      trailing: Icon(
        Icons.check,
        color: theme.themeMode == ThemeMode.dark
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.inversePrimary,
      ),
      onTap: () {
        theme.changeTheme(ThemeMode.dark);
      },
    );
  }
}
