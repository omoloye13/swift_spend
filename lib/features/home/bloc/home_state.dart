


import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  final int tabIndex;
  final bool hideTodo;

  HomeState ({
     this.tabIndex = 0,
     this.hideTodo= false,
});
  @override
  List<Object> get props =>[
    tabIndex,
    hideTodo,
  ];
}