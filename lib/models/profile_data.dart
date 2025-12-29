class ProfileData {
  final String name;
  final String title;
  final String bio;
  final String profileImagePath;
  final List<String> currentFocus;
  final Map<String, List<String>> skills;
  final List<ExperienceItem> experience;
  final List<SpeakingEngagement> speaking;
  final EducationItem education;

  const ProfileData({
    required this.name,
    required this.title,
    required this.bio,
    required this.profileImagePath,
    required this.currentFocus,
    required this.skills,
    required this.experience,
    required this.speaking,
    required this.education,
  });

  factory ProfileData.defaultProfile() {
    return ProfileData(
      name: 'Kajornsak Peerapathananont',
      title: 'Staff Software Engineer @ Fastwork',
      bio:
          'DevOps & Infrastructure | Mobile Platform & CI/CD | Building developer velocity through automation, build systems, macOS infrastructure, and mobile device farms',
      profileImagePath: 'assets/images/profile.png',
      currentFocus: [
        'Infrastructure automation and velocity optimization across multiple systems',
        'iOS and macOS CI/CD pipeline architecture and optimization',
        'Build systems and developer tooling that serve hundreds of engineers',
        'Mobile device farm management and testing infrastructure',
        'Developer experience improvements through AI-powered tools and automation',
      ],
      skills: {
        'Infrastructure & DevOps': [
          'CI/CD pipeline design and optimization (Jenkins, GitLab CI, Xcode Cloud)',
          'macOS infrastructure and build farm management',
          'iOS device farm orchestration and automation',
          'Build systems optimization and caching strategies',
          'Developer tooling and automation (fastlane, custom scripts)',
        ],
        'Mobile Development': [
          'iOS development (Objective-C, Swift)',
          'Android development (Java, Kotlin)',
          'Cross-platform frameworks (Flutter, React Native)',
          'Mobile UI frameworks and design systems',
          'Mobile testing strategies (unit, integration, UI automation)',
        ],
        'Platform Engineering': [
          'Code signing and provisioning automation',
          'Internal framework development and distribution',
          'Developer experience tooling and metrics',
          'Build performance analysis and optimization',
        ],
        'Additional Skills': [
          'Web development (React, Vue)',
          'AI-powered developer tools integration',
          'Mobile machine learning and on-device AI',
          'Technical speaking and knowledge sharing',
        ],
      },
      experience: [
        ExperienceItem(
          title: 'Staff Software Engineer',
          company: 'Fastwork',
          period: 'September 2025 - Present',
          description:
              'Focusing on enabling velocity across multiple systems, building developer experience tools, and managed mobile infrastructure',
        ),
        ExperienceItem(
          title: 'Staff Software Engineer',
          company: 'Agoda',
          period: 'February 2024 - September 2025',
          description:
              'DevOps team — Focused on enabling velocity across multiple systems within Agoda',
        ),
        ExperienceItem(
          title: 'Senior iOS Developer',
          company: 'Agoda',
          period: 'December 2021 - February 2024',
          description:
              'Platform team — Researched and developed improvements for developer experience, build systems, CI/CD, and managed macOS & iOS device farms',
        ),
        ExperienceItem(
          title: 'Senior iOS Developer',
          company: 'Doctor Raksa',
          period: 'April 2021 - November 2021',
          description:
              'Led and developed features for the Raksa iOS platform, spanning both the Doctor and Consumer applications',
        ),
        ExperienceItem(
          title: 'Mobile Developer',
          company: 'Agoda',
          period: '2018 - March 2021',
          description:
              'Maps team: Developed map-based product features (Apple Maps, Google Maps, Mapbox) and enhanced user experience. Core UI team: Developed and distributed internal UI frameworks aligned with design systems, established UI testing strategies, and implemented Android CI pipelines.',
        ),
      ],
      speaking: [
        SpeakingEngagement(
          event: 'Firebase Dev Day',
          date: 'November 2019',
          topic: 'Mobile Machine Learning for All Skill Levels',
        ),
        SpeakingEngagement(
          event: 'GDG DevFest Bangkok - Mobile Day',
          date: 'October 2019',
          topic: 'What\'s new in Flutter',
        ),
        SpeakingEngagement(
          event: 'Thailand Kotlin Day Meetup',
          date: 'August 2019',
          topic: 'Kotlin meets Web',
        ),
        SpeakingEngagement(
          event: 'Android Bangkok Conference',
          date: null,
          topic: 'From design to develop with Material Components',
        ),
      ],
      education: const EducationItem(
        degree: 'B.Eng. Software Engineering',
        institution:
            'King Mongkut\'s Institute of Technology Ladkrabang (KMITL), Thailand',
        graduationYear: 2018,
      ),
    );
  }
}

class ExperienceItem {
  final String title;
  final String company;
  final String period;
  final String description;

  const ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
  });
}

class SpeakingEngagement {
  final String event;
  final String? date;
  final String topic;

  const SpeakingEngagement({
    required this.event,
    this.date,
    required this.topic,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final int graduationYear;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.graduationYear,
  });
}
