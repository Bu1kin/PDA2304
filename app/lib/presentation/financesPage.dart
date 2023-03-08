import 'package:app/getmodel.dart';
import 'package:app/presentation/app_router.dart';
import 'package:app/state/cubit/data_cubit.dart';
import 'package:app/state/cubit/data_state.dart';
import 'package:app/user.dart';
import 'package:app/widget/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class FinancesPage extends StatefulWidget {
//   const FinancesPage({super.key});

//   @override
//   State<FinancesPage> createState() => _FinancesPageState();
// }

// class _FinancesPageState extends State<FinancesPage> {

//   TextEditingController _idCtrl = TextEditingController();
//   GlobalKey<FormState> _key = GlobalKey();

//   //GetModel model = GetModel("", true, 5, 0);

//   //GetModel model = GetModel(5, 0, "", true, "name");

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

class TestLol extends StatelessWidget {
  const TestLol({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController _idCtrl = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey();

    return Scaffold(
      body: BlocProvider(
        create: (context) => DataCubit(sl()),
        child: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: _idCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Поле пустое!';
                            }
                          },
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
                      Row(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                
                              },
                              child: Text('Поиск по ID', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, crud_finances);
                              },
                              child: Text('Манипуляции с данными', style: TextStyle(fontSize: 22))
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, optionsPage);
                              },
                              child: Text('Назад', style: TextStyle(fontSize: 22))
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Container(
                        height: 500,
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: context.read<DataCubit>().getAll(),
                            builder: (context, snapshot) {
                              List<Widget> listWidget = <Widget>[];
                              if(snapshot.hasData) {
                                listWidget = <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < snapshot.data!.length; i++) 
                                      Column(
                                        children: [
                                          Text(
                                            "id: ${snapshot.data?.elementAt(i).id}",
                                          ),
                                          Text(
                                            "Название: ${snapshot.data?.elementAt(i).financeName}",
                                          ),
                                          Text(
                                            "Описание: ${snapshot.data?.elementAt(i).financeDesc}",
                                          ),
                                          Text(
                                            "Категория: ${snapshot.data?.elementAt(i).financeCategory}",
                                          ),
                                          Text(
                                            "Дата: ${snapshot.data?.elementAt(i).financeDate}",
                                          ),
                                          Text(
                                            "Сумма: ${snapshot.data?.elementAt(i).financeSum}\n",
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ];
                              }
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: listWidget,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              );
            
          },
        ),
      ),
    );
  }
}