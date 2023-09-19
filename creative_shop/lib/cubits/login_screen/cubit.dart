import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sign_up_model.dart';
import 'states.dart';

import 'dart:convert';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false;
  void changeVisiblePassword() {
    visible = !visible;
    emit(LoginVisiblePasswordState());
  }

  void login(SignUpModel model) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      CollectionReference useref =
          FirebaseFirestore.instance.collection('users');
      QuerySnapshot data = await useref.get();
      List<QueryDocumentSnapshot> dataList = data.docs;
      for (var element in dataList) {
        String data = jsonEncode(element.data());
        var jsondata = jsonDecode(data);

        SignUpModel test = SignUpModel.fromJson(jsondata);
        if (test.email == model.email) {
          if (kDebugMode) {
            print(test.username);
          }
          model.username = test.username;
        }
      }

      emit(LoginSuccessState(model));
    } on FirebaseAuthException catch (erorr) {
      if (erorr.code == "user-not-found") {
        emit(LoginErorrState("No user found for this email."));
      } else if (erorr.code == "wrong-password") {
        emit(LoginErorrState("Wrong password."));
      }
    } catch (e) {
      emit(LoginErorrState(e.toString()));
    }
  }
}
