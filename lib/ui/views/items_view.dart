import 'package:flutter/material.dart';
import 'package:frontend/core/models/categories.dart';
import 'package:frontend/core/models/item.dart';
import 'package:frontend/core/view_models/items_model.dart';
import 'package:frontend/core/view_models/view_state.dart';
import 'package:frontend/ui/shared/app_colors.dart';
import 'package:frontend/ui/widgets/item_list_item.dart';

import 'base_view.dart';

class ItemsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ItemsModel>(
      onModelReady: (ItemsModel model) {
        model.getItems();
      },
      builder: (BuildContext context, ItemsModel model, Widget child) {
        final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('Ramsay Hall'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () async {
                  await Navigator.of(context).pushNamed('/items/filter');
                  model.getItems();
                },
              )
            ],
          ),
          body: Container(
            color: backgroundColor,
            child: RefreshIndicator(
              child: model.state == ViewState.Idle
                  ? (model.categories.isEmpty
                      ? const Center(
                          child: Text('No items match your specifications! '
                              'Why not filter fewer items?'),
                        )
                      : getCategoriesUi(model.categories))
                  : const Center(child: CircularProgressIndicator()),
              onRefresh: model.getItems,
            ),
          ),
          // FAB to add an item
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: showFab
              ? FloatingActionButton(
                  heroTag: 'main-fab',
                  backgroundColor: Colors.grey,
                  elevation: 2.0,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/items/add');
                  },
                )
              : null,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
            color: Colors.grey,
            shape: const CircularNotchedRectangle(),
          ),
        );
      },
    );
  }

  Widget getItemsUi(List<Item> items) => Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int i) {
            final Widget item = ItemListItem(
              item: items[i],
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: items[i]);
              },
            );
            return item;
          },
          itemCount: items.length,
        ),
      );

  Widget getCategoriesUi(Map<int, List<Item>> categories) {
    final List<int> categoryKeys = categories.keys.toList();
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int i) {
          Widget body = ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    defaultCategories[categoryKeys[i]].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories[categoryKeys[i]].map<Widget>(
                        (Item item) {
                          return ItemListItem(
                            item: item,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/item',
                                arguments: item,
                              );
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
          if(categories.length == (i + 1)) {
            return Container(
              padding: EdgeInsets.only(bottom: 30),
              child: body,
            );
          } else {
            return body;
          }
        },
      ),
    );
  }
}
