// ignore_for_file: body_might_complete_normally_catch_error, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:krown_sushi/Modules/Home/home.dart';
import 'package:krown_sushi/Modules/Menu/menu.dart';
import 'package:krown_sushi/Modules/Order_Finalization/orderFinalization.dart';
import 'package:krown_sushi/Modules/Order_History/orderHistory.dart';
import 'package:krown_sushi/Modules/Track_Orders/trackOrders.dart';
import 'package:krown_sushi/Shared/Constants/constants.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../Modules/Table_Reservation/tableReservation.dart';
import '../Shared/Components/components.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  late bool A1availability;
  late bool A2availability;
  late bool A3availability;
  late bool B1availability;
  late bool B2availability;
  late bool B3availability;
  late bool C1availability;
  late bool C2availability;
  late bool C3availability;
  late bool D1availability;
  late bool D2availability;
  late bool D3availability;
  AppCubit() : super(AppInitial()) {
    initializeAvailability();
  }

  static AppCubit get(context) => BlocProvider.of(context);
  var screenIndex = 0;
  void handleScreenChanged(int selected) {
    screenIndex = selected;
    emit(ScreenChanged());
  }

  Future<void> initializeAvailability() async {
    A1availability = await checkAvailability('A1');
    A2availability = await checkAvailability('A2');
    A3availability = await checkAvailability('A3');
    B1availability = await checkAvailability('B1');
    B2availability = await checkAvailability('B2');
    B3availability = await checkAvailability('B3');
    C1availability = await checkAvailability('C1');
    C2availability = await checkAvailability('C2');
    C3availability = await checkAvailability('C3');
    D1availability = await checkAvailability('D1');
    D2availability = await checkAvailability('D2');
    D3availability = await checkAvailability('D3');
    emit(TablesLoaded());
  }

  Future<bool> checkAvailability(String tableId) async {
    final tableSnapshot = await FirebaseFirestore.instance
        .collection('tables')
        .doc(tableId)
        .get();

    if (tableSnapshot.exists) {
      final status = tableSnapshot.data()!['status'];

      if (status == 'occupied') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
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
        .get()
        .whenComplete(() {
      emit(SearchSuccessState());
    }).catchError((e) {
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
      final List<DocumentSnapshot> results =
          await searchDocuments(searchQuery.toUpperCase());

      searchResults = results;
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('h:mm a dd/MM/yyyy');
    return formatter.format(now);
  }

  Future<void> makeOrder(
      {required String name,
      required String price,
      required String fulfillment,
      required String delivery,
      required List? customizations,
      required int quantity,
      required String image,
      required context}) async {
    emit(MakeOrderLoadingState());
    var order = {
      'name': name,
      'price': price,
      'fulfillment': fulfillment,
      'delivery_method': delivery,
      'date': getCurrentTime(),
      'customizations': customizations,
      'quantity': quantity,
      'image': image
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('orders')
        .add(order)
        .then((value) {
      value.update({'id': value.id});
      emit(MakeOrderSuccessState());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrderSuccess()),
      );
    }).catchError((e) {
      print(e.toString());
      emit(MakeOrderErrorState());
    });
  }

  var selectedTime;

  Future<void> timePicker(context) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // Using 12-Hour format with AM/PM indicators
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      selectedTime = result.format(context);
      emit(SelectTimeState());
    }
  }

  var selectedTable;
  selectTable(name) {
    selectedTable = name;
    emit(SelectTableState());
  }

  Future<void> updateTableStatusToOccupied(String tableId) async {
    final tableRef =
        FirebaseFirestore.instance.collection('tables').doc(tableId);

    await tableRef.update({'status': 'occupied'});
  }

  void occupyTable() async {
    var x = selectedTable;
    await updateTableStatusToOccupied(x);
    print('Table $x status updated to occupied.');
    emit(ReserveTable());
  }
}
