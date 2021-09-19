import 'package:mobx/mobx.dart';
import 'package:ticket_try/view/auth/model/request_model.dart';
import 'package:ticket_try/view/auth/service/login_service.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final LoginService _loginService;

  _LoginViewModelBase(this._loginService);

  login(LoginRequest loginRequest) async => _loginService.login(loginRequest);
}
