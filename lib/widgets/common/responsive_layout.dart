import 'package:flutter/widgets.dart';
import '../../config/constants.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    required this.desktop,
    super.key,
  });

  static DeviceType getDeviceType(double width) {
    if (width < AppConstants.mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < AppConstants.tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = getDeviceType(constraints.maxWidth);

        switch (deviceType) {
          case DeviceType.mobile:
            return mobile;
          case DeviceType.tablet:
            return tablet ?? desktop;
          case DeviceType.desktop:
            return desktop;
        }
      },
    );
  }
}

class ContentContainer extends StatelessWidget {
  final Widget child;

  const ContentContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth;

        if (constraints.maxWidth < AppConstants.mobileBreakpoint) {
          maxWidth = AppConstants.mobileMaxWidth;
        } else if (constraints.maxWidth < AppConstants.tabletBreakpoint) {
          maxWidth = AppConstants.tabletMaxWidth;
        } else {
          maxWidth = AppConstants.desktopMaxWidth;
        }

        return Center(
          child: Container(
            width: maxWidth == double.infinity ? null : maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: child,
          ),
        );
      },
    );
  }
}
