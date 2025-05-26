import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/login_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم لتشغيل async
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(UserModelAdapter()); // مهم جدًا
  await Hive.openBox<NoteModel>(kNotesBox);
  await Hive.openBox('auth');
  await Hive.openBox<UserModel>('users');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = Hive.box('auth').get('loggedIn', defaultValue: false);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesCubit()..fetchNotes()),
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: isLoggedIn ? const NotesView() : LoginView(),
      ),
    );
  }
}
