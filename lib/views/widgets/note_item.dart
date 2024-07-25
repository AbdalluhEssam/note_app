import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ),
        );
      },
      child: Card(
        color: const Color(0xffFFCC80),
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
                title: const Text("Flutter tips"),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text("Build Your Career with Abdalluh Essam"),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      size: 26,
                    )),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 24),
                child: Text(
                  "May 21 , 2024",
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
