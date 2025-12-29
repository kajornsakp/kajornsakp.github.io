import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';
import '../widgets/common/responsive_layout.dart';
import '../widgets/common/sketchy_nav_bar.dart';
import '../services/medium_rss_service.dart';
import '../services/url_launcher_service.dart';
import '../models/medium_post.dart';
import '../config/routes.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final _rssService = MediumRssService();
  List<MediumPost>? _posts;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final posts = await _rssService.fetchPosts();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SketchyScaffold(
      appBar: SketchyAppBar(
        title: const SketchyText('Blog'),
        actions: const [SketchyNavBar(currentRoute: Routes.blog)],
      ),
      body: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SketchyText('Latest Blog Posts', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            if (_isLoading)
              const Center(child: SketchyCircularProgressIndicator())
            else if (_error != null)
              SketchyCard(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SketchyText('Error loading posts: $_error'),
                ),
              )
            else if (_posts == null || _posts!.isEmpty)
              const SketchyText('No posts available.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _posts!.length,
                  itemBuilder: (context, index) {
                    final post = _posts![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () => UrlLauncherService.openUrl(post.link),
                        child: SketchyCard(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SketchyText(post.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                SketchyText(post.pubDate, style: const TextStyle(fontSize: 12)),
                                const SizedBox(height: 8),
                                SketchyText(
                                  _stripHtml(post.description),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (post.categories.isNotEmpty) ...[
                                  const SizedBox(height: 12),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: post.categories.take(3).map((tag) {
                                      return SketchyChip(label: SketchyText(tag));
                                    }).toList(),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
}
