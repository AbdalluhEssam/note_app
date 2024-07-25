import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const NoteItem(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemCount: 20),
    );
  }
}
