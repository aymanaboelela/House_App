import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> LogeIn({required String email, required String password}) async {
    emit(AuthLoding());
    // التحقق من صحة البريد الإلكتروني
    if (!EmailValidator.validate(email)) {
      emit(AuthUserFound(error: 'البريد الإلكتروني غير صالح'));
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      print('Sign in successful');
      emit(AuthSucceed());
    } on FirebaseAuthException catch (e) {
      print('Error during sign in: $e');
      if (e.code == 'user-not-found') {
        print('"لا يمكن الدخول"');
        emit(AuthUserFound(error: "لا يمكن الدخول"));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(AuthWrongPassword(error: "برجاء كتابة كلمة سر صحيحة"));
      } else {
        print("error: ${e.toString()}");
        emit(
          AuthFlid(
            error: e.toString(),
          ),
        );
      }
    }
  }
}
