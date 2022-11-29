import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4/cubit/cubit/click_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClickCubit(),
      child: BlocBuilder<ClickCubit, ClickState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const MyHomePage(),
            themeMode: state is LightTheme ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Вы нажали кнопку: '),

            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                return Text(
                  context.read<ClickCubit>().count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: context.read<ClickCubit>().list.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              context.read<ClickCubit>().list.elementAt(index),
                              style: Theme.of(context).textTheme.headline5,
                            )
                          );
                        }
                      ),
                    ),
                  );
              },
            ),

          ],
        ),
      ),
      
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(7.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<ClickCubit>().Click();
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<ClickCubit>().ClickDecrement();
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<ClickCubit>().ChangeTheme();
              },
              backgroundColor: Colors.grey,
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
