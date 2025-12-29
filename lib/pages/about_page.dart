import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../widgets/common/responsive_layout.dart';
import '../widgets/common/sketchy_nav_bar.dart';
import '../models/profile_data.dart';
import '../config/routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ProfileData.defaultProfile();

    return SketchyScaffold(
      appBar: SketchyAppBar(
        title: const SketchyText('About'),
        actions: const [SketchyNavBar(currentRoute: Routes.about)],
      ),
      body: SingleChildScrollView(
        child: ContentContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Center(
                child: Column(
                  children: [
                    SketchyFrame(
                      shape: SketchyFrameShape.circle,
                      width: 150,
                      height: 150,
                      child: ClipOval(
                        child: Image.asset(
                          profile.profileImagePath,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SketchyText(profile.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    SketchyText(profile.title, style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SketchyText(profile.bio, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 48),

              // Current Focus
              const SketchyText('Current Focus', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...profile.currentFocus.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SketchyText('• '),
                    Expanded(child: SketchyText(item)),
                  ],
                ),
              )),
              const SizedBox(height: 48),

              // Skills & Expertise
              const SketchyText('Skills & Expertise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...profile.skills.entries.map((category) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SketchyText(category.key, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...category.value.map((skill) => Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 4),
                      child: SketchyText('• $skill'),
                    )),
                  ],
                ),
              )),
              const SizedBox(height: 48),

              // Speaking & Community
              const SketchyText('Speaking & Community', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...profile.speaking.map((speaking) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SketchyText(
                      '${speaking.event}${speaking.date != null ? " (${speaking.date})" : ""}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SketchyText(speaking.topic),
                  ],
                ),
              )),
              const SketchyText('More talks at speakerdeck.com/kajornsakp'),
              const SizedBox(height: 48),

              // Experience Highlights
              const SketchyText('Experience Highlights', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...profile.experience.map((exp) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SketchyCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SketchyText(exp.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        SketchyText('${exp.company} • ${exp.period}'),
                        const SizedBox(height: 8),
                        SketchyText(exp.description),
                      ],
                    ),
                  ),
                ),
              )),
              const SizedBox(height: 48),

              // Education
              const SketchyText('Education', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              SketchyText(profile.education.degree, style: const TextStyle(fontWeight: FontWeight.bold)),
              SketchyText('${profile.education.institution} - ${profile.education.graduationYear}'),
            ],
          ),
        ),
      ),
    );
  }
}
