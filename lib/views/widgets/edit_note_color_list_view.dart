import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'list_view_color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {

  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40 * 2,
        child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.noteModel.color = colors[index].value;
                setState(() {});
              },
              child: ItemColor(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
            itemCount: colors.length));
  }
}
