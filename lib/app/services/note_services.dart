import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes/app/shared/dependencies.dart';

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
    
    await docRef.delete().onError((e, _) => log('Error in deleting document: $e'));

  }

  static updateData(String docId, Map<String, dynamic> data) async {
    String? uid = FirebaseAuthService.getUserId();

    var docRef = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes')
        .doc(docId);

    await docRef.update(data).onError((e, _) => log('Error in updating document: $e'));
  }

  static void addNote(String title, String content) async {
    String? uid = FirebaseAuthService.getUserId();

    var notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('userNotes');

    await notes.add({
      'title': title,
      'content': content,
      'timestamp': DateTime.now()
    });
  }
}
