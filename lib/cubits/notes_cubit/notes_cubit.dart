import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? filteredNotes; // <== الملاحظات بعد الفلترة

  fetchNotes() async {
    notes?.clear();
    final username = Hive.box('auth').get('username');
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.where((note) => note.username == username).toList();
    filteredNotes = notes;
    emit(NotesSuccess());
  }


  void searchNotes(String query) {
    if (query.isEmpty) {
      filteredNotes = notes;
    } else {
      filteredNotes = notes?.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.subTitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    emit(NotesSuccess());
  }
}