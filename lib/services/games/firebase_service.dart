import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getPlayerByUserAndGame(
      String userId, String gameId) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('players')
          .where('id_user', isEqualTo: userId)
          .where('id_game', isEqualTo: gameId)
          .limit(1) // Esto ayuda a optimizar si sabés que es un único resultado
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        print("No se encontró ningún documento con esos datos.");
        return null;
      }
    } catch (e) {
      print("Error al obtener player: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> updatePoints(
      String userId, String gameId, int points) async {
    try {
      // Referencia a la colección
      CollectionReference playersRef = _db.collection('players');

      // Buscar documento existente
      QuerySnapshot querySnapshot = await playersRef
          .where('id_user', isEqualTo: userId)
          .where('id_game', isEqualTo: gameId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Referencia al documento existente
        DocumentReference docRef = querySnapshot.docs.first.reference;

        // Obtener los datos actuales
        Map<String, dynamic> currentData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        int currentPoints = currentData['points'] ?? 0;

        // Sumar los puntos nuevos
        int updatedPoints = currentPoints + points;

        // Actualizar el documento con el nuevo total
        await docRef.update({'points': updatedPoints});

        // Devolver los datos actualizados
        DocumentSnapshot updatedDoc = await docRef.get();
        return updatedDoc.data() as Map<String, dynamic>;
      } else {
        // Si no existe, lo creamos
        DocumentReference newDoc = await playersRef.add({
          'id_game': gameId,
          'id_user': userId,
          'points': points,
        });

        DocumentSnapshot newSnapshot = await newDoc.get();
        return newSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error al actualizar/crear player: $e");
      return null;
    }
  }
}
