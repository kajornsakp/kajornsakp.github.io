import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/blog_page.dart';
import '../pages/not_found_page.dart';

class Routes {
  static const String home = '/';
  static const String about = '/about';
  static const String blog = '/blog';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      about: (context) => const AboutPage(),
      blog: (context) => const BlogPage(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case blog:
        return MaterialPageRoute(builder: (_) => const BlogPage());
      default:
        // Returns null to fall back to onUnknownRoute if not handled
        return null;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) => const NotFoundPage());
  }
}
