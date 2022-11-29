import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(LightTheme());

  int count = 0;
  List<String> list = <String>[];

  void Click(){
    if(state is LightTheme){
      count++;
      list.add('$count - светлая');
      emit(LightTheme());
    }
    else if(state is DarkTheme){
      count+= 2;
      list.add('$count - темная');
      emit(DarkTheme());
    }
  }

  void ClickDecrement(){
    if(state is LightTheme){
      count--;
      list.add('$count - светлая');
      emit(LightTheme());
    }
    else if(state is DarkTheme){
      count-= 2;
      list.add('$count - темная');
      emit(DarkTheme());
    }
  }

  void ChangeTheme(){
    if (state is LightTheme){
      emit(DarkTheme());
    }
    else{
      emit(LightTheme());
    }
  }
}
