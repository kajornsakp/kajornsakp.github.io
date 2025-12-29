import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../../models/social_link.dart';
import '../../services/url_launcher_service.dart';

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key});

  @override
  Widget build(BuildContext context) {
    final links = SocialLink.defaults;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: links.map((link) {
        return SketchyButton(
          onPressed: () => UrlLauncherService.openUrl(link.url),
          child: SketchyText(link.label),
        );
      }).toList(),
    );
  }
}
