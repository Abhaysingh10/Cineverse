import 'package:cloud_firestore/cloud_firestore.dart';

class MoviesModel {
  late final String description;
  late final String movieName;
  late final String poster;

  MoviesModel(
      {required this.description,
      required this.movieName,
      required this.poster});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        description: json['description'],
        movieName: json['movieName'],
        poster: json['poster']);
  }
}
