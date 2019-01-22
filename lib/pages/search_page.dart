import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/widgets/image_tile.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:pigment/pigment.dart';

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
      title: StreamBuilder<String>(
        stream: SearchProvider.of(context).tags,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Text("e621");
          } else {
            return Text("${snapshot.data}");
          }
        },
      ),
      actions: <Widget>[searchBar.getSearchAction(context)],
    );
  }

  @override
  void initState() {
    super.initState();
    searchBar = SearchBar(
        inBar: true,
        setState: setState,
        onSubmitted: _setTags,
        buildDefaultAppBar: _buildAppBar);
  }

  // The search bar doesn't like the Bloc pattern very much,
  // we have to wrap the sink in this method or it won't work.
  _setTags(String _tags) {
    SearchProvider.of(context).search.add(_tags);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("E621"),
                decoration: BoxDecoration(
                  color: Pigment.fromString("#152f56"),
                ),
              ),
              ListTile(
                title: Text("About"),
              )
            ],
          ),
        ),
      ),
      appBar: searchBar.build(context),
      body: StreamBuilder<List<PostListItem>>(
        stream: SearchProvider.of(context).items,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.isNotEmpty) {
            var items = snapshot.data;
            return RefreshIndicator(
              onRefresh: SearchProvider.of(context).refresh,
              child: GridView.builder(
                itemCount: items.length + 1,
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth ~/ 175,
                ),
                itemBuilder: (context, i) {
                  if (i < items.length) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ImageTile(
                        post: items[i],
                      ),
                    );
                  } else {
                    SearchProvider.of(context).loadMore.add(items.last.id);
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      ":(",
                      style: TextStyle(fontSize: 80.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("No posts matched your search."),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
