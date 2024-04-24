import 'dart:convert';
import 'dart:math';

import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  saveQuotes({
    required List<QuoteModel> list,
  });

  Future<List<QuoteModel>> loadRandomQuotes() ;
}

class LocalStorageImpl extends LocalStorage {

  @override
  Future<List<QuoteModel>> loadRandomQuotes() async {
    var sharedPref = await SharedPreferences.getInstance();

    final keys = sharedPref.getKeys().toList();
    if (keys.isNotEmpty) {
      final random = Random();
      final randomKey = keys[random.nextInt(keys.length)];
      var quote = sharedPref.getString(randomKey);
      if(quote != null) {
        return [QuoteModel.fromJson(json.decode(quote))];
      }
    }

    return [];
  }

  @override
  saveQuotes({required List<QuoteModel> list}) async {
    var sharedPref = await SharedPreferences.getInstance();
    var item = list.first;
    if(item != null){
      await sharedPref.setString(item.id, json.encode(item));
    }
  }
  
}