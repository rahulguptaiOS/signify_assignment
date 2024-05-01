import 'dart:convert';
import 'dart:math';
import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  saveQuotes({
    required List<QuoteModel> list,
  });

  Future<List<QuoteModel>> loadRandomQuotes();
}

class LocalStorageImpl extends LocalStorage {
  @override
  Future<List<QuoteModel>> loadRandomQuotes() async {
    var sharedPref = await SharedPreferences.getInstance();

    final keys = sharedPref.getKeys().toList();
    List<QuoteModel> list = [];
    if (keys.isNotEmpty) {
      final random = Random();
      while (list.length < 5) {
        final randomKey = keys[random.nextInt(keys.length)];
        final String? quote = sharedPref.getString(randomKey);
        list.add(QuoteModel.fromJson(json.decode(quote ?? "")));
      }
    }

    return list;
  }

  @override
  saveQuotes({required List<QuoteModel> list}) async {
    var sharedPref = await SharedPreferences.getInstance();
    for (QuoteModel item in list) {
      await sharedPref.setString(item.id, json.encode(item));
    }
  }
}
