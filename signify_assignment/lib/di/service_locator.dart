import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:signify_assignment/data/source/network/api_client.dart';
import 'package:signify_assignment/data/source/network/api_service.dart';
import 'package:signify_assignment/data/source/quote_repository_impl.dart';
import 'package:signify_assignment/presentation/cubit/quotes_cubit.dart';

import '../data/source/local/local_storage.dart';
import '../domain/repository/quote_repository.dart';
import '../domain/use_cases/get_quotes.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerFactory<ApiClient>(() => ApiClient(Dio()));
  getIt.registerFactory<ApiService>(() => ApiService(Dio()));
  getIt.registerFactory<LocalStorage>(() => LocalStorageImpl());
  getIt.registerFactory<QuoteRepository>(
          () => QuoteRepositoryImpl(apiClient: getIt(), apiService: getIt() , localStorage: getIt()));
  getIt.registerFactory<GetQuotesUseCase>(() => GetQuotesUseCase(repository: getIt()));
  getIt.registerFactory(() => QuotesCubit(getQuotesUseCase: getIt()));
}
