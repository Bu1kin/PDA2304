import 'package:app/presentation/app_router.dart';
import 'package:app/state/cubit/auth_cubit.dart';
import 'package:app/state/cubit/auth_state.dart';
import 'package:app/user.dart';
import 'package:app/widget/locator_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _userNameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: BlocProvider(
              create: (context) => AuthCubit(sl()),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is SuccessState) {
                    Navigator.pushReplacementNamed(context, optionsPage);
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Дорбо пожаловать!',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _userNameCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Поле пустое!';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Логин',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _userNameCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _passwordCtrl,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Поле пустое!';
                            }
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Пароль',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _passwordCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  try{
                                    context.read<AuthCubit>().signIn(User(
                                      userName: _userNameCtrl.text,
                                      password: _passwordCtrl.text));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                    print(e);
                                  }
                                }
                              },
                              child: Text('Войти')),
                          const SizedBox(width: 20),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, signUpPage);
                              },
                              child: Text('Регистрация')),
                        ],
                      ),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ),
    );
  }
}
