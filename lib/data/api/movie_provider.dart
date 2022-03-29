import 'package:filmguru/data/api/movies_service_local.dart';
import 'package:filmguru/data/model/movie_item.dart';
import 'package:filmguru/repository/movies_repository.dart';
import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier{
  final MoviesRepository _repository = MoviesRepository(MoviesServiceLocal());
  
  List<MovieItem> items = <MovieItem>[];

  Future<void> getMovieItems()async{
    items = await _repository.getMovies();
    notifyListeners();
  }
}
