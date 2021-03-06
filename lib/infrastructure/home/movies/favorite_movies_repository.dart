import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/home/movies/favorite_movies/favorite_movies.dart';
import '../../../domain/home/movies/favorite_movies_interface.dart';
import '../../../domain/home/movies/movie/movies_failure.dart';
import '../../../infrastructure/core/firestore_helper.dart';

@LazySingleton(as: FavoriteMoviesInterface)
class FavoriteMoviesRepository extends FavoriteMoviesInterface {
  final FirebaseFirestore _firestore;

  FavoriteMoviesRepository(this._firestore);

  @override
  Future<Either<MovieFailure, Unit>> createFavoriteMovie(int movieId) async {
    try {
      final favoriteMovieDoc = await _firestore.favoriteMovieDocument(movieId);
      await favoriteMovieDoc.set({"id": movieId});

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const MovieFailure.insufficientPermissions());
      } else {
        //log error
        return left(const MovieFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<MovieFailure, Unit>> deleteFavoriteMovie(int movieId) async {
    try {
      final favoriteMovieDoc = await _firestore.favoriteMovieDocument(movieId);
      await favoriteMovieDoc.delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const MovieFailure.insufficientPermissions());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const MovieFailure.unexpected());
      } else {
        //log error
        return left(const MovieFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<MovieFailure, List<FavoriteMovie>>>
      watchMovieFavorites() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc
        .collection('movies')
        .snapshots()
        .map(
          (snapshot) => right<MovieFailure, List<FavoriteMovie>>(
            snapshot.docs
                .map((doc) => FavoriteMovie.fromFirebase(doc))
                .toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const MovieFailure.insufficientPermissions());
      } else {
        return left(const MovieFailure.unexpected());
      }
    });
  }
}
