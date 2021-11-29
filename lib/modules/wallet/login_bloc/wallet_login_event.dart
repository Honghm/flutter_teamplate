part of 'wallet_login_bloc.dart';

abstract class WalletLoginEvent extends Equatable {
  const WalletLoginEvent();
}

class WalletLoginEmailChanged extends WalletLoginEvent {
  final String email;

  WalletLoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class WalletLoginPasswordChanged extends WalletLoginEvent {
  final String password;

  WalletLoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class WalletLoginRememberMeChanged extends WalletLoginEvent {
  final bool rememberMe;
  final ValueChanged<bool> rememberMeChanged;
  WalletLoginRememberMeChanged(this.rememberMe, this.rememberMeChanged);
  @override
  List<Object?> get props => [rememberMe, rememberMeChanged];
}

class WalletLoginClicked extends WalletLoginEvent {
  final WalletLoginCallback onWalletLoginClicked;
  WalletLoginClicked(this.onWalletLoginClicked);
  @override
  List<Object?> get props => [onWalletLoginClicked];
}

class WalletLoginForgotPasswordClicked extends WalletLoginEvent {
  final Future<bool?> Function() onForgotPasswordClicked;
  WalletLoginForgotPasswordClicked(this.onForgotPasswordClicked);
  @override
  List<Object?> get props => [onForgotPasswordClicked];
}
