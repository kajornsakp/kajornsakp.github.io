import '../config/constants.dart';

enum SocialPlatform {
  twitter,
  linkedin,
  github,
  medium,
  email,
  speakerdeck,
}

class SocialLink {
  final SocialPlatform platform;
  final String url;
  final String displayName;

  const SocialLink({
    required this.platform,
    required this.url,
    required this.displayName,
  });

  String get label {
    switch (platform) {
      case SocialPlatform.twitter:
        return 'Twitter';
      case SocialPlatform.linkedin:
        return 'LinkedIn';
      case SocialPlatform.github:
        return 'GitHub';
      case SocialPlatform.medium:
        return 'Medium';
      case SocialPlatform.email:
        return 'Email';
      case SocialPlatform.speakerdeck:
        return 'Speaker Deck';
    }
  }

  static List<SocialLink> get defaults {
    return [
      const SocialLink(
        platform: SocialPlatform.twitter,
        url: AppConstants.twitterUrl,
        displayName: '@${AppConstants.twitterHandle}',
      ),
      const SocialLink(
        platform: SocialPlatform.linkedin,
        url: AppConstants.linkedinUrl,
        displayName: AppConstants.linkedinHandle,
      ),
      const SocialLink(
        platform: SocialPlatform.github,
        url: AppConstants.githubUrl,
        displayName: AppConstants.githubHandle,
      ),
      const SocialLink(
        platform: SocialPlatform.medium,
        url: AppConstants.mediumUrl,
        displayName: '@${AppConstants.mediumHandle}',
      ),
      const SocialLink(
        platform: SocialPlatform.email,
        url: 'mailto:${AppConstants.email}',
        displayName: AppConstants.email,
      ),
      const SocialLink(
        platform: SocialPlatform.speakerdeck,
        url: AppConstants.speakerdeckUrl,
        displayName: 'speakerdeck.com/kajornsakp',
      ),
    ];
  }
}
