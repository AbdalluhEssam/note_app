import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        children: [

          CustomAppBar(
            title: "Notes",
            icon: Icons.search,
            onPressed: () {},
          ),
          Expanded(child: NotesListView())
        ],
      ),
    ));
  }
}
