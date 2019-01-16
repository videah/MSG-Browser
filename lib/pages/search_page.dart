import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/widgets/image_tile.dart';
import 'package:msg_browser/api/models/post_list_item.dart';

class SearchPage extends StatefulWidget {

  @override
  SearchPageState createState() {
    return new SearchPageState();
  }

}

class SearchPageState extends State<SearchPage> {

  SearchBar searchBar;

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("e621"),
      actions: <Widget>[
        searchBar.getSearchAction(context)
      ],
    );
  }

  SearchPageState() {
    searchBar = SearchBar(
      inBar: true,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: _buildAppBar
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("E621"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Bookmarked Tags"),
              leading: Icon(Icons.collections_bookmark),
            )
          ],
        ),
      ),
      appBar: searchBar.build(context),
      body: StreamBuilder<List<PostListItem>>(
        stream: SearchProvider.of(context).items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data;
            return GridView.count(
              padding: EdgeInsets.all(8.0),
              crossAxisCount: 2,
              children: List.generate(items.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ImageTile(post: items[index],),
                );
              }),
            );
          } else {
            return Container();
          }
        }
      )
    );
  }
}