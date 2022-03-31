import 'package:http/http.dart' as http;
import 'package:newsgen/news/models/news_model.dart';

class NewsRepository {
  final String url =
      "https://newsapi.org/v2/everything?q=petrol&apiKey=6b03edfd40594926bf8788c53deaaeff";

  Future<NewsModel> getNews() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return newsModelFromJson(response.body);
    } else {
      throw Exception("Failed to load news");
    }
  }
}
