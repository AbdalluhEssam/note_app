import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final Box<UserModel> _userBox = Hive.box<UserModel>('users');

  void signUp(String username, String password) async {
    emit(AuthLoading());
    try {
      final exists = _userBox.values.any((u) => u.username == username);
      if (exists) {
        emit(AuthFailure("اسم المستخدم موجود بالفعل"));
      } else {
        await _userBox.add(UserModel(username: username, password: password));
        emit(AuthSuccess());
      }
    } catch (e) {
      emit(AuthFailure("حدث خطأ أثناء إنشاء الحساب"));
    }
  }

  void login(String username, String password) {
    emit(AuthLoading());
    try {
      final user = _userBox.values.firstWhere(
            (u) => u.username == username && u.password == password,
        orElse: () => throw Exception("بيانات الدخول غير صحيحة"),
      );
      Hive.box('auth').put('loggedIn', true);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure("اسم المستخدم أو كلمة المرور غير صحيحة"));
    }
  }

  void logout() {
    Hive.box('auth').put('loggedIn', false);
    emit(AuthInitial());
  }

  bool isLoggedIn() {
    return Hive.box('auth').get('loggedIn', defaultValue: false);
  }
}