import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  // base url
  static String baseUrl = dotenv.get('BASE_URL');

  // ElasticSearch
  static String elasticSearchUrl = dotenv.get('ES_URL');

  static String authHeader = 'Apikey ${dotenv.get('ES_TOKEN')}';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static String getPosts = '$baseUrl/posts';
}
