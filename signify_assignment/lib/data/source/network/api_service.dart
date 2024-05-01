import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:signify_assignment/data/models/quote_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://quote-garden.onrender.com/api/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/quotes?limit=5')
  Future<QuoteResponse> getQuotes();
}
