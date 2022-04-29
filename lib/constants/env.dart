import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();

  static String baseUrl = dotenv.get('BASE_URL');

  static String googleMapApiKey = dotenv.get('GOOGLE_MAP_API_KEY');

  static String esUrl = dotenv.get('ES_URL');

  static String esToken = dotenv.get('ES_TOKEN');
}
