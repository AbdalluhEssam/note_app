import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/widgets/custom_texty_field.dart';
import '../cubits/auth_cubit.dart';
import 'login_view.dart';
import 'widgets/custom_button.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginView()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Image.asset('assets/icon/icon.png', width: 200, height: 200),
                  const SizedBox(height: 30),
                  const Text('تسجيل حساب جديد', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hint: 'اسم المستخدم',
                    controller: username,
                    validator: (value) => value == null || value.isEmpty ? 'اسم المستخدم مطلوب' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hint: 'كلمة المرور',
                    controller: password,
                    obscureText: true,
                    validator: (value) => value == null || value.isEmpty ? 'كلمة المرور مطلوبة' : null,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signUp(username.text, password.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("كل الحقول مطلوبة")));
                      }
                    },
                    text: 'تسجيل',
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("عندك حساب؟ ارجع لتسجيل الدخول"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
