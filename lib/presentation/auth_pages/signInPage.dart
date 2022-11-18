import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';
import 'package:flutter_application_1/data/repositories/auth_repositories_impl.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/domain/usercases/auth.dart';

//Авторизация
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key); //добавь тут

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _loginCtrl = TextEditingController();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Дорбо пожаловать!',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),

                const Spacer(),

                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _loginCtrl,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Поле пустое!';
                      }
                      if(value.length < 5){
                        return 'Поле должно быть более 5 символов!';
                      }
                      if(!value.contains(RegExp(r'[a-zA-Z]'))){
                        return 'Только английские буквы!';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){
                          _loginCtrl.clear();
                        },
                      )
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _passwordCtrl,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Поле пустое!';
                      }
                      if(value.length < 5){
                        return 'Поле должно быть более 5 символов!';
                      }
                      if(!value.contains(RegExp(r'[a-zA-Z]'),0)){
                        return 'Только английские буквы!';
                      }
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Пароль',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){
                          _passwordCtrl.clear();
                        },
                      )
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          signIn();
                        }
                        else{

                        }
                      },
                      child: Text('Войти')
                    ),

                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, signUpPage);
                        },
                        child: Text('Регистрация')
                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ),
        )
      ),
    );
  }

  void signIn() async{
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();
    var result = await Auth(auth).signIn(
      LoginParams(
        login: _loginCtrl.text, 
        password: _passwordCtrl.text, 
      )
    );

    result.fold((l){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Неверный логин или пароль!'),
        ),
      );
    }, 
    (r) {
      switch(r){
        case RoleEnum.admin: {
          Navigator.pushReplacementNamed(context, adminPage);
          break;
        }
        case RoleEnum.user: {
          Navigator.pushReplacementNamed(context, userPage);
          break;
        }
      }
    });
  }
}