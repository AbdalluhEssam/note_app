import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/signup_view.dart';
import 'package:note_app/views/widgets/custom_texty_field.dart';

import '../cubits/auth_cubit.dart';
import 'notes_view.dart';
import 'widgets/custom_button.dart';


class LoginView extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NotesView()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Image.asset(
                  'assets/icon/icon.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 30),
                const Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                CustomTextField(hint: 'اسم المستخدم', controller: username),
                const SizedBox(height: 12),
                CustomTextField(hint: 'كلمة المرور', controller: password, obscureText: true),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () => context.read<AuthCubit>().login(username.text, password.text),
                  text: 'تسجيل الدخول',
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpView())),
                  child: const Text("ما عندكش حساب؟ سجل هنا"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}