import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../widgets/common/responsive_layout.dart';
import '../config/routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchyScaffold(
      appBar: SketchyAppBar(title: const SketchyText('404')),
      body: ContentContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error.gif',
                width: 300,
              ),
              const SizedBox(height: 24),
              const SketchyText('Page Not Found', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              SketchyButton(
                onPressed: () => Navigator.pushNamed(context, Routes.home),
                child: const SketchyText('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
