part of 'click_cubit.dart';

@immutable
abstract class ClickState {}

class OnClick extends ClickState {}

class LightTheme extends ClickState{}

class DarkTheme extends ClickState{}

class BaseList extends ClickState {}

class ListSize extends ClickState {}