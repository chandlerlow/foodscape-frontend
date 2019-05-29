import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/view_item.dart';

import 'item_creation.dart';

class _ItemsWidgetState extends State<ItemsWidget> {
  final List<Item> _items = <Item> [];
  //final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ramsay Hall'),
      ),
      body: ItemCardWidget(),
      drawer: makeDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        elevation: 2.0,
        child: const Icon(Icons.add),
        //label: const Text('Add an item'),
        onPressed: () {
          //TODO: pass item as an argument for the widget
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreationWidget()));
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }

  Drawer makeDrawer() {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //TODO: get name of
            new UserAccountsDrawerHeader(
              accountEmail: new Text("jenny.xu18@bristol.ac.uk"),
              accountName: new Text(
                "Jenny Xu", style: TextStyle(fontSize: 24),),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: new Text("JX", style: TextStyle(fontSize: 24),),
              ),
            ),
            ListTile(
              title: Text('My Items',
                style: TextStyle(fontSize: 18),),
              onTap: () {
                //TODO: add action
              },
            ),
            ListTile(
              title: Text('My Details', style: TextStyle(fontSize: 18),),
              onTap: () {
                //TODO: add action
              },
            ),
          ]
      ),

    );
  }
}

class ItemListWidget extends StatefulWidget {
  @override
  ItemListState createState() => ItemListState();
}

class ItemListState extends State<ItemListWidget> {
  //constructs a list view of cards
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}

class ItemCardWidget extends StatefulWidget {
  @override
  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends State<ItemCardWidget> {
  //constructor an item card with Data Class
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewItemWidget())),
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              //image widget with overlays
              Container(
                child: Column(
                  children: <Widget>[
                    Text("Days Left",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Location",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                width: 200,
                height: 150,
                color: Colors.red,
                padding: EdgeInsets.only(
                  right: 10,
                ),
                /*
                This would enable a image to be displayed as the background for the container

                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(assetName),
                  fit: BoxFit.cover)
                ), */
              ),
              //maybe add another container for padding or increase margins on upper container
              //widget for containing information
              Container(
                child: Text("ITEM TITLE",
                style: TextStyle(fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
                width: 200,
                height: 50,
              ),
            ],
          ),
          width: 200,
          height: 200,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      )
    );
  }
}






class ItemCardsWidget extends StatefulWidget {
  @override
  _ItemCardsState createState() => _ItemCardsState();
}

class _ItemCardsState extends State<ItemCardsWidget>{

  //data passed into constructor
  @override
  Widget build(BuildContext context) {
    return
    Container(
      padding: EdgeInsets.only(
          top: 20 ),
      child: ListView(
        children: <Widget>[
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                height: 100,
                child: Text('A card that can be tapped'),
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
          ),

          Card(
            child: InkWell(
              splashColor: Colors.red.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                height: 100,
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
         ]
        )
    );
  }
}
class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class Item {

}
