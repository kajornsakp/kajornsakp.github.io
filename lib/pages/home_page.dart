import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../widgets/common/responsive_layout.dart';
import '../widgets/common/sketchy_nav_bar.dart';
import '../widgets/common/social_links_row.dart';
import '../config/routes.dart';
import '../config/constants.dart';
import '../services/url_launcher_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchyScaffold(
      appBar: SketchyAppBar(
        title: const SketchyText('Kajornsak Peerapathananont'),
        actions: const [SketchyNavBar(currentRoute: Routes.home)],
      ),
      body: ContentContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile image with sketchy frame
              SketchyFrame(
                shape: SketchyFrameShape.circle,
                width: 200,
                height: 200,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Name
              const SketchyText(
                'Kajornsak Peerapathananont',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Bio
              const SketchyText(
                'Staff Software Engineer @ Fastwork | DevOps & Infrastructure',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const SketchyText(
                'Mobile Platform & CI/CD | Building developer velocity through automation',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Social links
              const SocialLinksRow(),
              const SizedBox(height: 48),

              // Quick links
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  SketchyButton(
                    onPressed: () => Navigator.pushNamed(context, Routes.about),
                    child: const SketchyText('About Me'),
                  ),
                  SketchyButton(
                    onPressed: () => Navigator.pushNamed(context, Routes.blog),
                    child: const SketchyText('Read Blog'),
                  ),
                  SketchyButton(
                    onPressed: () => UrlLauncherService.openUrl(
                      AppConstants.resumeAssetPath,
                    ),
                    child: const SketchyText('View Resume'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
