import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:ticket_try/core/components/buttons/login_button.dart';
import 'package:ticket_try/core/components/input/login_input.dart';
import 'package:ticket_try/view/auth/model/request_model.dart';
import 'package:ticket_try/view/auth/service/login_service.dart';
import 'package:ticket_try/view/auth/view/login_resources.dart';
import 'package:ticket_try/view/auth/view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginResources {
  late final LoginService _service;
  late final LoginViewModel _viewModel;
  late final Dio _dio;
  late final BaseOptions _baseOptions;
  late final TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _baseOptions = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(_baseOptions);
    _service = LoginService(_dio);
    _viewModel = LoginViewModel(_service);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.customWidth(1),
      padding: [32, 20].paddingSymmetric,
      alignment: Alignment.center,
      child: Column(
        children: [
          LoginInput(hint: email),
          30.hSized,
          LoginInput(
            hint: password,
          ),
          24.hSized,
          LoginButton(
            label: login,
            onTap: () {
              _viewModel.login(
                  LoginRequest(email: 'myapp@test.com', password: '12345'));
            },
          ),
        ],
      ),
    );
  }
}
