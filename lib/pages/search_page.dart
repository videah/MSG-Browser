import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/widgets/e621_drawer.dart';
import 'package:msg_browser/widgets/error_message.dart';
import 'package:msg_browser/widgets/image_tile.dart';
import 'package:msg_browser/api/models/post_list_item.dart';
import 'package:state_persistence/state_persistence.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  SearchBar searchBar;

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: StreamBuilder<String>(
        stream: BlocProvider.of<SearchBloc>(context).tags,
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
    BlocProvider.of<SearchBloc>(context).search.add(_tags);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    SearchBloc searchProvider = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      drawer: E621Drawer(),
      appBar: searchBar.build(context),
      body: StreamBuilder<List<PostListItem>>(
        stream: searchProvider.items,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorMessage(error: snapshot.error);
          if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator(),
          );
          var items = snapshot.data;
          return PersistedStateBuilder(
            builder: (context, storage) {
              if (!snapshot.hasData) return Container();
              return RefreshIndicator(
                onRefresh: searchProvider.refresh,
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
                          idgaf: false,
                        ),
                      );
                    } else if (searchProvider.noMorePages) {
                      return Container();
                    } else {
                      searchProvider.loadMore.add(items.last.id);
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              );
            }
          );
        },
      ),
    );
  }
}
