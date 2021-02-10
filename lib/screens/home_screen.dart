import 'package:amanokerim/blocs/home_bloc.dart';
import 'package:amanokerim/models/post.dart';
import 'package:amanokerim/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = -1;
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
    _bloc.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Цвета"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Филтр",
              ),
              onChanged: (value) => _bloc.add(value),
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, List<Post>>(
              key: Key('builder ${selected.toString()}'),
              builder: (context, posts) => Center(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ExpansionTile(
                      key: Key(i.toString()),
                      initiallyExpanded: i == selected,
                      onExpansionChanged: (value) {
                        if (value) // expand currend tile
                          setState(() => selected = i);
                        else // no one selected, collapse all
                          setState(() => selected = -1);
                      },
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      title: Text(
                        posts[i].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      childrenPadding:
                          const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => selected = -1),
                          child: Text(posts[i].body),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(posts[i]),
                            ),
                          ),
                          child: Text(
                            "Подробнее",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
