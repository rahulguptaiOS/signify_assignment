import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:signify_assignment/data/source/network/api_client.dart';

import '../utility/file_handler.dart';
import 'service_test.mocks.dart';
import 'package:flutter/services.dart' show rootBundle;


@GenerateMocks([ApiClient])
void main() {
  group("ApiClient", () {
    test("getQuote", () async {
      var service = MockApiClient();
      when(service.getQuotes()).thenAnswer((realInvocation) async {
        return [QuoteModel(["Famous Quotes"], "william-shakespeare", "2019-08-16", "2023-04-14", 56, "DlQmGRzNGo3i", "It is not in the stars to hold our destiny but in ourselves.", "author")];
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
}