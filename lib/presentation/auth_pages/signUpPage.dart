import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';
import 'package:flutter_application_1/data/repositories/auth_repositories_impl.dart';
import 'package:flutter_application_1/domain/usercases/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _loginCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _fioCtrl = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                const Text('Регистрация',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),

                const Spacer(),

                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
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
                  margin: const EdgeInsets.only(bottom: 10.0),
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

                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _fioCtrl,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Поле пустое!';
                      }
                      if(value.length < 5){
                        return 'Поле должно быть более 5 символов!';
                      }
                      if (value.contains(RegExp(r"[A-Za-z]"),0)) {
                        return 'Только русские символы!';
                      }
                      if (value.contains(RegExp(r'[0-9]'),0)) {
                        return 'Нельзя использовать цифры!';
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'ФИО',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){
                          _fioCtrl.clear();
                        },
                      )
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if(_key.currentState!.validate()){
                          signUp();
                        }
                      }, 
                      child: Text('Подтвердить')
                    ),

                    const SizedBox(width: 20,),

                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, signInPage);
                      }, 
                      child: Text('Назад')
                    ),
                  ],
                ),

                const Spacer(),
              ]
            ),
          ),
        )
      ),
    );
  }

  void signUp() async{
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();
    var result = await Auth(auth).signUp(
      AuthParams(
        login: _loginCtrl.text, 
        password: _passwordCtrl.text, 
        FIO: _fioCtrl.text, 
      )
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Нельзя зарегистрировать пользователя!')
        )
      );
    }, 

    (r) {
      Navigator.pushNamed(context, adminPage);
    });
  }
}