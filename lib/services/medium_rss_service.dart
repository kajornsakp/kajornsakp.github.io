import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medium_post.dart';
import '../config/constants.dart';

class MediumRssService {
  List<MediumPost> _cachedPosts = [];
  DateTime? _lastFetch;
  static const cacheDuration = Duration(hours: 1);

  Future<List<MediumPost>> fetchPosts({bool forceRefresh = false}) async {
    // Return cache if valid
    if (!forceRefresh &&
        _cachedPosts.isNotEmpty &&
        _lastFetch != null &&
        DateTime.now().difference(_lastFetch!) < cacheDuration) {
      return _cachedPosts;
    }

    try {
      final response = await http.get(Uri.parse(AppConstants.mediumRssUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List;

        _cachedPosts = items.map((item) => MediumPost.fromJson(item)).toList();
        _lastFetch = DateTime.now();

        return _cachedPosts;
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      // If fetch fails but we have cache, return it
      if (_cachedPosts.isNotEmpty) {
        return _cachedPosts;
      }
      rethrow;
    }
  }
}
