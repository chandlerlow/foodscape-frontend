import 'package:frontend/core/models/categories.dart';
import 'package:frontend/core/models/recipe_recommendation.dart';
import 'package:frontend/core/services/authentication_service.dart';
import 'package:frontend/core/services/recipe_api.dart';
import 'package:frontend/core/services/recipe_recommendation_api.dart';
import 'package:frontend/core/view_models/item_creation_model.dart';
import 'package:frontend/core/view_models/item_editing_model.dart';
import 'package:frontend/core/view_models/item_operation_model.dart';
import 'package:frontend/core/view_models/items_model.dart';
import 'package:frontend/core/view_models/recipe_model.dart';
import 'package:frontend/core/view_models/recipe_recommendation_model.dart';
import 'package:frontend/core/view_models/user_items_model.dart';
import 'package:frontend/core/view_models/register_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/view_models/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => RecipeApi());
  locator.registerLazySingleton(() => UserCategories());
  locator.registerLazySingleton(() => RecipeRecommendationApi());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RegisterModel());
  locator.registerFactory(() => ItemsModel());
  locator.registerFactory(() => RecipeModel());
  locator.registerFactory(() => RecipeRecommendationModel());
  locator.registerFactory(() => UserItemsModel());
  locator.registerFactory(() => ItemCreationModel());
  locator.registerFactory(() => ItemEditingModel());
  locator.registerFactory(() => ItemOperationsModel());
}
