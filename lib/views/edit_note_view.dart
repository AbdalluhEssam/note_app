import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/edit_view_body.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        noteModel: noteModel,
      ),
    );
  }
}
