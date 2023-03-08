import 'package:app/getmodel.dart';
import 'package:app/model/finance.dart';
import 'package:app/presentation/app_router.dart';
import 'package:app/state/cubit/data_cubit.dart';
import 'package:app/state/cubit/data_state.dart';
import 'package:app/widget/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CRUD_Finances extends StatefulWidget {
  const CRUD_Finances({super.key});

  @override
  State<CRUD_Finances> createState() => _CRUD_FinancesState();
}

class _CRUD_FinancesState extends State<CRUD_Finances> {

  TextEditingController _idCtrl = TextEditingController();
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _descCtrl = TextEditingController();
  TextEditingController _categoryCtrl = TextEditingController();
  TextEditingController _sumCtrl = TextEditingController();

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
              create: (context) => DataCubit(sl()),
              child: BlocConsumer<DataCubit, DataState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Манипуляции с финансами',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextField(
                          controller: _idCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'ID',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _idCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _nameCtrl,
                          
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Название',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _nameCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _descCtrl,
                          
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Описание',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _descCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _categoryCtrl,
                          
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Категория',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _categoryCtrl.clear();
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _sumCtrl,
                          
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Сумма',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _sumCtrl.clear();
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
                                  
                                    context.read<DataCubit>().addFinance(
                                      Finance(
                                        financeName: _nameCtrl.text,
                                        financeDesc: _descCtrl.text,
                                        financeDate: DateTime.now().toString(),
                                        financeCategory: _categoryCtrl.text,
                                        financeSum: _sumCtrl.text,
                                      ),
                                    );
                                    Navigator.pushReplacementNamed(context, crud_finances);
                                  
                                },
                                child: Text('Добавить', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                  try{
                                    context.read<DataCubit>().updateFinance(
                                      Finance(
                                        id: int.parse(_idCtrl.text),
                                        financeName: _nameCtrl.text,
                                        financeDesc: _descCtrl.text,
                                        financeDate: DateTime.now().toString(),
                                        financeCategory: _categoryCtrl.text,
                                        financeSum: _sumCtrl.text,
                                      ),
                                    );
                                    Navigator.pushReplacementNamed(context, crud_finances);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                    print(e);
                                  }
                              },
                              child: Text('Изменить', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  context.read<DataCubit>().deleteFinance(int.parse(_idCtrl.text), 0);
                                }
                              },
                              child: Text('Удалить логически', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  context.read<DataCubit>().deleteFinance(int.parse(_idCtrl.text), 1);
                                }
                              },
                              child: Text('Удалить физически', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: custom_width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, financesPage);
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