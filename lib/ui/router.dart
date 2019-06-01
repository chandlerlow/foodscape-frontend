import 'package:flutter/material.dart';
import 'package:frontend/core/models/item.dart';
import 'package:frontend/ui/views/item_creation_view.dart';
import 'package:frontend/ui/views/item_view.dart';
import 'package:frontend/ui/views/items_view.dart';
import 'package:frontend/ui/views/login_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/items/add':
        return MaterialPageRoute<dynamic>(builder: (_) => ItemCreationView());
      case '/items':
        return MaterialPageRoute<dynamic>(builder: (_) => ItemsView());
      case '/item':
        final Item item = settings.arguments;
        return MaterialPageRoute<dynamic>(builder: (_) => ItemView(item: item));
      case '/login':
        return MaterialPageRoute<dynamic>(builder: (_) => LoginView());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
