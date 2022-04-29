import 'package:fruity/constants/env.dart';

class Endpoints {
  Endpoints._();

  // base url
  static String baseUrl = Env.baseUrl;

  // ElasticSearch
  static String elasticSearchUrl = Env.esUrl;

  static String authHeader = 'Apikey ${Env.esToken}';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static String getPosts = '$baseUrl/posts';
}
