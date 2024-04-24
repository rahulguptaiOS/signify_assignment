import 'package:connectivity/connectivity.dart';
import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:signify_assignment/data/source/local/local_storage.dart';
import 'package:signify_assignment/data/source/network/api_client.dart';
import 'package:signify_assignment/domain/entity/quote.dart';
import 'package:signify_assignment/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  QuoteRepositoryImpl({
    required ApiClient apiClient,
    required LocalStorage localStorage,
  })  : _apiClient = apiClient,
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

      final List<QuoteModel> quotes = await _apiClient.getQuotes();
      _localStorage.saveQuotes(list: quotes);
      return quotes;
    } catch (e) {
      return _localStorage.loadRandomQuotes();
    }
  }
}