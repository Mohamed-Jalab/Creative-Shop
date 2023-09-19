import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sign_up_model.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(SignUpVisiblePasswordState());
  }

  void signUp(SignUpModel model) async {
    try {
      emit(SignUpLoadingState());
      FirebaseAuth user = FirebaseAuth.instance;
      await user.createUserWithEmailAndPassword(
          email: model.email, password: model.password);
      final userRef = FirebaseFirestore.instance
          .collection('users')
          .withConverter<SignUpModel>(
            fromFirestore: (snapshot, _) =>
                SignUpModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );
      await userRef.add(
        SignUpModel(
          username: model.username,
          email: model.email,
          password: model.password,
        ),
      );
      emit(SignUpSccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        emit(SignUpErorrState("Your password is weak"));
      } else if (e.code == "email-already-in-use") {
        emit(SignUpErorrState("The account already exists for that email."));
      }
    } catch (e) {
      emit(SignUpErorrState(e.toString()));
    }
  }
}
