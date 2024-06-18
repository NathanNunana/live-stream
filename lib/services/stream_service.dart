part of '_index.dart';

class StreamService {
  final List<Map<String, String>> vids = [
    {"id": "1", "title": "Video 1", "url": "https://example.com/video1"},
    {"id": "2", "title": "Video 2", "url": "https://example.com/video2"},
    {"id": "3", "title": "Video 3", "url": "https://example.com/video3"},
    {"id": "4", "title": "Video 4", "url": "https://example.com/video4"},
    {"id": "5", "title": "Video 5", "url": "https://example.com/video5"},
    {"id": "6", "title": "Video 6", "url": "https://example.com/video6"},
    {"id": "7", "title": "Video 7", "url": "https://example.com/video7"},
    {"id": "8", "title": "Video 8", "url": "https://example.com/video8"},
    {"id": "9", "title": "Video 9", "url": "https://example.com/video9"},
    {"id": "10", "title": "Video 10", "url": "https://example.com/video10"}
  ];

  Future<List<Video>> fetchVideos() async {
    // Simulating an API call or data fetching process
    await Future.delayed(const Duration(seconds: 1));

    // Mapping list of maps to list of Video objects
    List<Video> videos =
        vids.map((videoMap) => Video.fromJson(videoMap)).toList();
    return videos;
  }
}
