import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>  NoteItem(noteModel: notes[index],),
              separatorBuilder: (context, index) =>
              const SizedBox(
                height: 8,
              ),
              itemCount: notes.length ?? 0),
        );
      },
    );
  }
}
