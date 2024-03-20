

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/home/bloc/home_state.dart';


class HomeBloc extends Cubit<HomeState>{
  HomeBloc():super(HomeState());

  //emitting or dispatching an action
void updateTabIndex ( int newIndex )async {
  emit (HomeState(tabIndex: newIndex));

}

void hideTodoList()async{
  emit(HomeState(hideTodo: true));
}
}