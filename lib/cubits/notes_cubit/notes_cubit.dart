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
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    filteredNotes = notes; // أول مرة بتكون كلها
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