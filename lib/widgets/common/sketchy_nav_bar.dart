import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../../config/routes.dart';

class SketchyNavBar extends StatelessWidget {
  final String currentRoute;

  const SketchyNavBar({required this.currentRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(
          title: 'Home',
          route: Routes.home,
          isActive: currentRoute == Routes.home,
        ),
        const SizedBox(width: 16),
        _NavLink(
          title: 'About',
          route: Routes.about,
          isActive: currentRoute == Routes.about,
        ),
        const SizedBox(width: 16),
        _NavLink(
          title: 'Blog',
          route: Routes.blog,
          isActive: currentRoute == Routes.blog,
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String route;
  final bool isActive;

  const _NavLink({
    required this.title,
    required this.route,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SketchyButton(
      onPressed: isActive ? null : () => Navigator.pushNamed(context, route),
      child: SketchyText(title),
    );
  }
}
