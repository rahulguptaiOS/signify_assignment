import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:signify_assignment/data/models/quote_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.quotable.io/quotes/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/random')
  Future<List<QuoteModel>> getQuotes();
}