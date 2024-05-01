import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:signify_assignment/data/models/quote_response.dart';
import 'package:signify_assignment/data/source/network/api_client.dart';
import 'package:signify_assignment/data/source/network/api_service.dart';
import 'service_test.mocks.dart';

@GenerateMocks([ApiClient, ApiService])
void main() {
  group("ApiClient", () {
    test("getQuote", () async {
      var service = MockApiClient();
      when(service.getQuotes()).thenAnswer((realInvocation) async {
        return [
          QuoteModel(
              ["Famous Quotes"],
              "william-shakespeare",
              "2019-08-16",
              "2023-04-14",
              56,
              "DlQmGRzNGo3i",
              "It is not in the stars to hold our destiny but in ourselves.",
              "author")
        ];
      });
      final response = await service.getQuotes();
      expect(response.isNotEmpty, true);
    });
    test("getNoQuote", () async {
      var service = MockApiClient();
      when(service.getQuotes()).thenAnswer((realInvocation) async {
        return [];
      });
      final response = await service.getQuotes();
      expect(response.isNotEmpty, false);
    });
  });

  group("ApiService", () {
    test("getQuote", () async {
      var service = MockApiService();
      when(service.getQuotes()).thenAnswer((realInvocation) async {
        var pagination = Pagination(currentPage: 1, nextPage: 2, totalPages: 2);
        var data = Data(
            id: "1",
            quoteText:
                "It is not in the stars to hold our destiny but in ourselves.",
            quoteAuthor: "author",
            quoteGenre: "age",
            v: 20);
        return QuoteResponse(
            statusCode: 200,
            message: "Success",
            pagination: pagination,
            totalQuotes: 1,
            data: [data]);
      });
      final response = await service.getQuotes();
      expect(response.statusCode, 200);
    });
    test("getNoQuote", () async {
      var service = MockApiService();
      when(service.getQuotes()).thenAnswer((realInvocation) async {
        var pagination = Pagination(currentPage: 1, nextPage: 2, totalPages: 2);
        return QuoteResponse(
            statusCode: 200,
            message: "Success",
            pagination: pagination,
            totalQuotes: 1,
            data: []);
      });
      final response = await service.getQuotes();
      expect(response.data.isNotEmpty, false);
    });
  });
}
