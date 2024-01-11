import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'generated/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// Commands for running easy localization and generating code
  /// flutter pub run easy_localization:generate -o codegen_loader.g.dart -S lib/assets/strings
  /// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S lib/assets/strings
  runApp(
    EasyLocalization(
      child: LocalizationApp(),
      supportedLocales: [Locale('uz'), Locale('ru'), Locale('en')],
      path: 'lib/assets/strings',
      fallbackLocale: Locale('uz'),
      saveLocale: true,
      assetLoader: CodegenLoader(),
    ),
  );
}

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  List<String> list = [
    "phone",
    "hello",
    "back",
    "go",
    "sleep",
    "days_ago",
    "welcome",
    "start",
    "stop",
    "yes",
    "no",
    "up",
    "down",
    "left",
    "right",
    "morning",
    "evening",
    "today",
    "yesterday",
    "tomorrow",
    "soon",
    "never",
    "always",
    "maybe",
    "definitely",
    "possibly",
    "clearly",
    "obviously",
    "perhaps",
    "surely",
    "actually",
    "eventually",
    "come",
    "recently",
    "currently",
    "previously",
    "initially",
    "ultimately",
    "specifically",
    "particularly",
    "generally",
    "naturally",
    "normally",
    "usually",
    "rarely",
    "occasionally",
    "frequently",
    "constantly",
    "regularly",
    "often",
  ];

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localization"),
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (
            BuildContext context,
            int index,
            ) {
          return Container(
            child: Center(
              child: Text("${list[index].tr()}"),
            ),
          );
        },
        itemCount: 50,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.large(
            onPressed: () {
              context.setLocale(Locale('en'));
            },
            child: Text("English"),
          ),
          FloatingActionButton.large(
            onPressed: () {
              context.setLocale(Locale('ru'));
            },
            child: Text("Русский"),
          ),
          FloatingActionButton.large(
            onPressed: () {
              context.setLocale(Locale('uz'));
            },
            child: Text("O'zbek"),
          ),
        ],
      ),
    );
  }
}
