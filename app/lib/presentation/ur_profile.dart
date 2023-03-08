import 'package:app/presentation/app_router.dart';
import 'package:app/state/cubit/auth_cubit.dart';
import 'package:app/state/cubit/auth_state.dart';
import 'package:app/user.dart';
import 'package:app/widget/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UrProfile extends StatefulWidget {
  const UrProfile({super.key});

  @override
  State<UrProfile> createState() => _UrProfileState();
}

class _UrProfileState extends State<UrProfile> {
  TextEditingController _userNameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double custom_width = MediaQuery.of(context).size.width * 0.3;

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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Успешное изменение профиля!")));
                    
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ваш профиль',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _userNameCtrl,
                          
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
                        controller: _emailCtrl,
                        
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Email',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _emailCtrl.clear();
                              },
                            )),
                        ),
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthCubit>().updateProfile(
                                  User(
                                    userName: _userNameCtrl.text,
                                    email: _emailCtrl.text,
                                  )
                                );
                              },
                              child: Text('Изменить профиль', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, optionsPage);
                            },
                            child: Text('Назад', style: TextStyle(fontSize: 22))),
                          ),
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