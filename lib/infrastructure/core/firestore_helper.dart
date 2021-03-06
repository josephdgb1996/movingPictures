import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/auth/auth_repository_interface.dart';
import '../../domain/core/errors.dart';
import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<AuthInterface>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection('users').doc(user.email);
  }

  Future<DocumentReference> favoriteMovieDocument(int movieId) async {
    final userDoc = await userDocument();

    return userDoc.collection('movies').doc(movieId.toString());
  }

  Future<DocumentReference> favoriteSerieDocument(int serieId) async {
    final userDoc = await userDocument();

    return userDoc.collection('series').doc(serieId.toString());
  }

  Future<DocumentReference> peopleDocument(String personEmail) async {
    final userDoc = await userDocument();

    return userDoc.collection('people').doc(personEmail);
  }
}

// extension DocumentReferenceX on DocumentReference {
//   CollectionReference get userDataCollection => collection('userdata');
// }
