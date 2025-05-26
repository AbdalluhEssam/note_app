import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/views/login_view.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: Colors.white30,
                child: Icon(
                  Icons.person,
                  size: 33,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Hello , ${Hive.box('auth').get('username')}!",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
              const Spacer(),
              IconButton.outlined(
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                onPressed: () {
                  Hive.box('auth').delete('username');
                  Hive.box('auth').delete('loggedIn');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginView()),
                      (route) => false);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomAppBar(
            title: "Notes",
            icon: Icons.logout_outlined,
            onPressed: () {
              Hive.box('auth').delete('username');
            },
          ),
          const SizedBox(height: 12),
          const Expanded(child: NotesListView())
        ],
      ),
    ));
  }
}
