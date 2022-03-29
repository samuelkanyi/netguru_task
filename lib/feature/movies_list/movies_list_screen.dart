import 'package:filmguru/data/api/model/movie_item_response.dart';
import 'package:filmguru/data/api/movie_provider.dart';
import 'package:filmguru/data/api/movies_service_local.dart';
import 'package:filmguru/data/model/movie_item.dart';
import 'package:filmguru/feature/movies_list/widgets/movie_item_row.dart';
import 'package:filmguru/generated/l10n.dart';
import 'package:filmguru/repository/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatelessWidget {
  late MovieProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = context.read<MovieProvider>();
    return  Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).mainAppBarTitle),
              ),
              body: FutureBuilder(
                future: provider.getMovieItems(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                    return _movieData(context);
                
                },
              ) 
              );
  }

  Widget _movieData(BuildContext context) {
    final List<MovieItem> _items = provider.items;
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItemRow(_items[index]);
        });
  }
}
