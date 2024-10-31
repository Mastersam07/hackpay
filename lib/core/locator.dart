import 'package:hackpay/core/network/dio_network_service.dart';
import 'package:hackpay/core/network/network_api_service.dart';
import 'package:hackpay/features/auth/data/auth_repo.dart';
import 'package:hackpay/features/auth/domain/repositories/auth_repo.dart';
import 'package:hackpay/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:hackpay/features/auth/presentation/viewmodels/signup_viewmodel.dart';

import 'package:get_it/get_it.dart';
import 'package:hackpay/features/transactions/presentation/viewmodels/transaction_viewmodel.dart';

class AppDependencies {
  AppDependencies._();

  static final i = AppDependencies._();
  static final locate = GetIt.instance;
  Future<void> register() async {
    locate.registerLazySingleton<NetworkApiService>(() => DioNetworkService());
    locate.registerFactory<AuthRepo>(() => AuthRepoImpl());
    locate.registerFactory(() => LoginViewmodel(locate()));
    locate.registerFactory(() => SignupViewmodel(locate()));
    locate.registerFactory(() => TransactionViewmodel());
  }

  Future<void> reset() {
    return locate.reset();
  }
}
