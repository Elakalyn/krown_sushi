import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krown_sushi/Modules/Customize_Order/customizeOrder.dart';
import 'package:krown_sushi/Modules/Dish_Details/dishDetails.dart';
import 'package:krown_sushi/Modules/Host/host.dart';
import 'package:krown_sushi/Network/Remote/firebase_options.dart';
import 'package:krown_sushi/Modules/Home/home.dart';
import 'package:krown_sushi/Modules/Menu/menu.dart';
import 'package:krown_sushi/Modules/Order_Finalization/orderFinalization.dart';
import 'package:krown_sushi/Modules/Table_Reservation/tableReservation.dart';
import 'package:krown_sushi/Modules/Track_Orders/trackOrders.dart';

import 'cubit/app_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Host(),
      ),
    );
  }
}
