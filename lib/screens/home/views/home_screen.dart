import 'dart:math';

import 'package:budget_project/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:budget_project/screens/add_expense/view/add_expense.dart';
import 'package:budget_project/screens/home/views/main_screen.dart';
import 'package:budget_project/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 3,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home,
                        color: index == 0 ? selectedItem : unselectedItem),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.graph_square_fill,
                        color: index == 1 ? selectedItem : unselectedItem),
                    label: 'Stats')
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => BlocProvider(
                            create: (context) => CreateCategoryBloc(
                              FirebaseExpenseRepo()
                            ),
                            child: const AddExpense(),
                          )));
            },
            shape: const CircleBorder(),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  )),
              child: const Icon(CupertinoIcons.add),
            )),
        body: index == 0 ? const MainScreen() : const StatScreen());
  }
}
