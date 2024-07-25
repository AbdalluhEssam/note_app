import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 24, right: 24),
      child: Column(
        children: [
          CustomAppBar(title: "Notes",icon: Icons.search,),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
