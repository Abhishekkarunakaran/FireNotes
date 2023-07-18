import 'dart:developer';

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:intl/intl.dart';

class NoteServices {
  static getFireStoreStream() {
    String? uid = FirebaseAuthService.getUserId();

    var notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes');

    return notes.snapshots();
  }

  static void deleteNote(String docId) async {
    String? uid = FirebaseAuthService.getUserId();

    var docRef = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes')
        .doc(docId);

    await docRef
        .delete()
        .onError((e, _) => log('Error in deleting document: $e'));
  }

  static updateData(String docId, Map<String, dynamic> data) async {
    String? uid = FirebaseAuthService.getUserId();

    var docRef = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes')
        .doc(docId);

    await docRef
        .update(data)
        .onError((e, _) => log('Error in updating document: $e'));
  }

  static void addNote(String title, String content) async {
    String? uid = FirebaseAuthService.getUserId();

    var notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes');

    await notes
        .add({'title': title, 'content': content, 'createdAt': DateTime.now()});
  }

  static String processDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    DateTime now = DateTime.now();

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return DateFormat.jm().format(dateTime);
    }
    if (dateTime.year == now.year) {
      return DateFormat.MMMd().format(dateTime);
    }

    return DateFormat.yMMMd().format(dateTime);
  }
}
