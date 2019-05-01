import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:msg_browser/blocs/search_bloc.dart';
import 'package:msg_browser/pages/search_page.dart';

class HomePage extends StatelessWidget {

  final _searchController = TextEditingController();

  var mascots = [
    "/images/mascot_bg/esix1.jpg",
    "/images/mascot_bg/esix2.jpg",
    "/images/mascot_bg/raptor1.jpg",
    "/images/mascot_bg/hexerade.jpg",
    "/images/mascot_bg/wiredhooves.jpg",
    "/images/mascot_bg/ecmajor.jpg",
    "/images/mascot_bg/evalionfix.jpg",
    "/images/mascot_bg/peacock.png"
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("e621"),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://e621.net/images/mascot_bg/esix1.jpg",
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Center(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10.0,
                                  sigmaY: 10.0,
                                ),
                                child: Container(
                                  child: Center(
                                    child: TextField(
                                      controller: _searchController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "male -female order:score",
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.grey[300],
                          textColor: Colors.black,
                          child: Text("Search"),
                          onPressed: () {
                            bloc.search.add(_searchController.value.text);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => SearchPage())
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.grey[300],
                          textColor: Colors.black,
                          child: Text("Change Mascot"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
