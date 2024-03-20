import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_spend/features/account/screens/account_view.dart';
import 'package:swift_spend/features/home/bloc/home_bloc.dart';
import 'package:swift_spend/features/home/bloc/home_state.dart';
import 'package:swift_spend/features/home/screens/home_view.dart';
import 'package:swift_spend/features/invest/screens/invest_view.dart';
import 'package:swift_spend/features/savings/screens/savings_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //creating the list of components for navigation bar items
  var listOfComponents = [HomeView(), SavingsView(), Account(), Invest()];
  // var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //bloc logic
    HomeBloc homeBloc = context.watch<HomeBloc>();
    HomeState homeState = homeBloc.state;
    int selectedIndex = homeState.tabIndex;
    return Scaffold(
      body: IndexedStack(
        children: listOfComponents,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.amber,
        selectedItemColor: Colors.green,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            homeBloc.updateTabIndex(value);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: "Savings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rocket_launch), label: "Invest"),
        ],
      ),
    );
  }
}
