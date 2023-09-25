import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krown_sushi/Modules/Home/home.dart';
import 'package:krown_sushi/Modules/Menu/menu.dart';
import 'package:krown_sushi/Modules/Order_History/orderHistory.dart';
import 'package:krown_sushi/Modules/Track_Orders/trackOrders.dart';
import 'package:meta/meta.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../Modules/Table_Reservation/tableReservation.dart';
import '../Shared/Components/components.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  var screenIndex = 0;
  void handleScreenChanged(int selected) {
    screenIndex = selected;
    emit(ScreenChanged());
  }

  List<Widget> Screens = [
    HomeScreen(),
    MenuScreen(),
    TableReservation(),
    TrackOrders(),
    OrderHistory(),
  ];

  void completeOrder(context, index) {
    screenIndex = index;
    emit(ScreenChanged());
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  Widget navigator() => NavigationDrawer(
        onDestinationSelected: (index) => handleScreenChanged(index),
        selectedIndex: screenIndex,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Krown Sushi',
            ),
          ),
          36.h,
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Main Screens',
            ),
          ),
          18.h,
          ...destinations.map(
            (ExampleDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      );

  var selectedFilter;
  dynamic appetizerColor = Colors.white;
  dynamic mainDishColor = Colors.white;
  dynamic desertsColor = Colors.white;

  void selectFilter(filter) {
    if (filter == 1) {
      selectedFilter = 'Appetizer';
      appetizerColor = Colors.grey[300];
      mainDishColor = Colors.white;
      desertsColor = Colors.white;
    } else if (filter == 2) {
      selectedFilter = 'Main dish';
      appetizerColor = Colors.white;
      mainDishColor = Colors.grey[300];
      desertsColor = Colors.white;
    } else if (filter == 3) {
      selectedFilter = 'Desert';
      appetizerColor = Colors.white;
      mainDishColor = Colors.white;
      desertsColor = Colors.grey[300];
    }
    emit(SelectedFilterState());
  }

  Future<List<DocumentSnapshot>> searchDocuments(String searchQuery) async {
    emit(SearchLoadingState());
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('dishes') // Replace with your collection name
        .where('name', isGreaterThanOrEqualTo: searchQuery)
        .get().whenComplete(() {
          emit(SearchSuccessState());
        }).catchError((e){
          emit(SearchErrorState());
          print(e.toString());
        });

    return snapshot.docs;
  }

  String searchQuery = '';
  List<DocumentSnapshot> searchResults = [];

  void performSearch() async {
    emit(StartSearchState());
    if (searchQuery.isNotEmpty) {
      final List<DocumentSnapshot> results = await searchDocuments(searchQuery.toUpperCase());

      searchResults = results;
    }
  }
}
