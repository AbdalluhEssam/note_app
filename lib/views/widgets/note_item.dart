import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              noteModel: noteModel,
            ),
          ),
        );
      },
      child: Card(
        color: Color(noteModel.color),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                // textColor: Colors.black,
                iconColor: Colors.black,
                titleTextStyle: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
                title: Text(noteModel.title),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(noteModel.subTitle),
                ),
                trailing: IconButton(
                    onPressed: () {
                      noteModel.delete();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      size: 26,
                    )),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 24),
                child: Text(
                  "${DateFormat.yMd().format(DateTime.parse(noteModel.date))} ${DateFormat.jm().format(DateTime.parse(noteModel.date))}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
