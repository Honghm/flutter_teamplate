import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';

part 'wallet_login_event.dart';
part 'wallet_login_state.dart';

class WalletLoginBloc extends Bloc<WalletLoginEvent, WalletLoginState> {

   final RegExp emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final RegExp passReg = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");


WalletLoginBloc() : super(WalletLoginState.initial()) {
    on<WalletLoginEmailChanged>((event, emit) {
      bool result = emailReg.hasMatch(event.email);
      if (!result) {
        emit(state.copyWith(
            emailValidator: "Invalid Email", email: event.email));
      } else {
        emit(state.copyWith(emailValidator: "", email: event.email));
      }
    });
    on<WalletLoginPasswordChanged>((event, emit) {
      if (!passReg.hasMatch(event.password)) {
        emit(state.copyWith(
            passwordValidator: "Invalid Password", password: event.password));
      } else {
        emit(state.copyWith(passwordValidator: "", password: event.password));
      }
    });
    on<WalletLoginRememberMeChanged>((event, emit) {
      emit(state.copyWith(rememberMe: event.rememberMe));
    });
    on<WalletLoginClicked>((event, emit) async {
      
      if (!passReg.hasMatch(state.password) || !emailReg.hasMatch(state.email))
        return;

      emit(state.copyWith(buttonStatus: ButtonStatus.loading));
     
      await event.onWalletLoginClicked(
        state.email,
        state.password,
        () {
          emit(state.copyWith(buttonStatus: ButtonStatus.success));
        },
        () {
          emit(state.copyWith(buttonStatus: ButtonStatus.fail));
        },
      );
      print(state.buttonStatus);

      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(buttonStatus: ButtonStatus.idle));
    });
    on<WalletLoginForgotPasswordClicked>((event, emit) async {
      final result = await event.onForgotPasswordClicked();
      if (result != null && result == true) {
        emit(state.copyWith(isNotification: true));
        emit(state.copyWith(isNotification: false));
      }
    });
  }

}
