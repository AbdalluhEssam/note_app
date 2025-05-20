import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomAppBar({super.key, required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'ابحث...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              BlocProvider.of<NotesCubit>(context).searchNotes(value);
            },
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ],
    );
  }
}