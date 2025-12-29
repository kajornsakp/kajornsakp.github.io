import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import 'config/routes.dart';
import 'pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchyApp(
      title: 'Kajornsak Peerapathananont | Staff Software Engineer',
      theme: SketchyThemeData.fromTheme(SketchyThemes.blue, roughness: 0.7),
      themeMode: SketchyThemeMode.system,
      home: const HomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
      onUnknownRoute: Routes.onUnknownRoute,
    );
  }
}
