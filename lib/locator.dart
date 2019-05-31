import 'package:frontend/core/view_models/item_creation_model.dart';
import 'package:frontend/core/view_models/items_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ItemsModel());
  locator.registerFactory(() => ItemCreationModel());
  locator.registerLazySingleton(() => Api());
}