import 'package:connectivity/connectivity.dart';
import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:signify_assignment/data/models/quote_response.dart';
import 'package:signify_assignment/data/source/local/local_storage.dart';
import 'package:signify_assignment/data/source/network/api_client.dart';
import 'package:signify_assignment/data/source/network/api_service.dart';
import 'package:signify_assignment/domain/entity/quote.dart';
import 'package:signify_assignment/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final ApiClient _apiClient;
  final ApiService _apiService;
  final LocalStorage _localStorage;

  QuoteRepositoryImpl({
    required ApiClient apiClient,
    required ApiService apiService,
    required LocalStorage localStorage,
  })  : _apiClient = apiClient,
        _apiService = apiService,
        _localStorage = localStorage;

  Future<bool> _isDeviceOffline() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult == ConnectivityResult.none;
  }

  @override
  Future<List<Quote>> getQuote() async {
    try {
      var isOffline = await _isDeviceOffline();
      if(isOffline){
        return _localStorage.loadRandomQuotes();
      }
      final responses = await Future.wait([_apiClient.getQuotes(), _apiService.getQuotes() ]);
      if(responses[0] != null){
        final List<QuoteModel> quotes =  List<QuoteModel>.from(responses[0] as List);
        _localStorage.saveQuotes(list: quotes);
        return quotes;
      }

      final QuoteResponse quotes =  responses[1] as QuoteResponse;
      final quoteList = quotes.getQuoteList();
      _localStorage.saveQuotes(list: quoteList);
      return quoteList;
    } catch (e) {
      return _localStorage.loadRandomQuotes();
    }
  }
}