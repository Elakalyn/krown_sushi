// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:krown_sushi/Modules/Search/search.dart';

class TableReservation extends StatelessWidget {
  TableReservation({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var freeDoubleTable = Image.asset('assets/FreedoubleTable.png');
    var freeFamilyTable = Image.asset('assets/freeFamilyTable.png');
    var occupiedDoubleTable = Image.asset('assets/occupiedDoublesTable.png');
    var occupiedFamilyTable = Image.asset('assets/occupiedFamilyTable.png');

    // ALL OF THEM HAVE SUBTYPES OF FUTURE BOOLS, THEY CANNOT BE ACCESSED
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is ReserveTable) {
          AppCubit.get(context).initializeAvailability();
        }
      },
      builder: (context, state) {
        AppCubit.get(context).initializeAvailability();
        return Scaffold(
          key: _key,
          drawer: AppCubit.get(context).navigator(),
          body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: CircleAvatar(
                            child: const Icon(Icons.menu, color: Colors.white),
                            backgroundColor: HexColor('6750A4'),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()),
                            );
                          },
                          child: CircleAvatar(
                            child:
                                const Icon(Icons.search, color: Colors.white),
                            backgroundColor: HexColor('6750A4'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ConditionalBuilder(
                        condition: state is TablesLoaded,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => Column(
                          children: [
                            40.h,
                            Row(
                              children: [
                                Text(
                                  "Date/Time",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Spacer(),
                                ActionChip(
                                  label: Text('17/9/2023 9:30 PM'),
                                  onPressed: () {
                                    AppCubit.get(context).timePicker(context);
                                  },
                                ),
                              ],
                            ),
                            40.h,
                            Container(
                              width: 320,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: HexColor('#EDEDED'),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(34, 83, 83, 83),
                                      blurRadius: 20,
                                      offset: Offset(0, 4),
                                      spreadRadius: 8,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    5.w,
                                    table(
                                      group: 'A',
                                      number: '1',
                                      status:
                                          AppCubit.get(context).A1availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'A',
                                      number: '2',
                                      status:
                                          AppCubit.get(context).A2availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'A',
                                      number: '3',
                                      status:
                                          AppCubit.get(context).A3availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    5.w,
                                  ],
                                ),
                              ),
                            ),
                            10.h,
                            Container(
                              width: 320,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: HexColor('#EDEDED'),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(34, 83, 83, 83),
                                      blurRadius: 20,
                                      offset: Offset(0, 4),
                                      spreadRadius: 8,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    5.w,
                                    table(
                                      group: 'B',
                                      number: '1',
                                      status:
                                          AppCubit.get(context).B1availability,
                                      imageFree: freeFamilyTable,
                                      imageOccupied: occupiedFamilyTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'B',
                                      number: '2',
                                      status:
                                          AppCubit.get(context).B2availability,
                                      imageFree: freeFamilyTable,
                                      imageOccupied: occupiedFamilyTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'B',
                                      number: '3',
                                      status:
                                          AppCubit.get(context).B3availability,
                                      imageFree: freeFamilyTable,
                                      imageOccupied: occupiedFamilyTable,
                                    ),
                                    5.w,
                                  ],
                                ),
                              ),
                            ),
                            10.h,
                            Container(
                              width: 320,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: HexColor('#EDEDED'),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(34, 83, 83, 83),
                                      blurRadius: 20,
                                      offset: Offset(0, 4),
                                      spreadRadius: 8,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    5.w,
                                    table(
                                      group: 'C',
                                      number: '1',
                                      status:
                                          AppCubit.get(context).C1availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'C',
                                      number: '2',
                                      status:
                                          AppCubit.get(context).C2availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'C',
                                      number: '3',
                                      status:
                                          AppCubit.get(context).C3availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    5.w,
                                  ],
                                ),
                              ),
                            ),
                            10.h,
                            Container(
                              width: 320,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: HexColor("#EDEDED"),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(34, 83, 83, 83),
                                      blurRadius: 20,
                                      offset: Offset(0, 4),
                                      spreadRadius: 8,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    5.w,
                                    table(
                                      group: 'D',
                                      number: '1',
                                      status:
                                          AppCubit.get(context).D1availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'D',
                                      number: '2',
                                      status:
                                          AppCubit.get(context).D2availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    const Spacer(),
                                    table(
                                      group: 'D',
                                      number: '3',
                                      status:
                                          AppCubit.get(context).D3availability,
                                      imageFree: freeDoubleTable,
                                      imageOccupied: occupiedDoubleTable,
                                    ),
                                    5.w,
                                  ],
                                ),
                              ),
                            ),
                            40.h,
                            if (AppCubit.get(context).selectedTable == null)
                              const SizedBox(
                                width: double.maxFinite,
                                child: FilledButton(
                                  child: Text('No table selected.'),
                                  onPressed: null,
                                ),
                              ),
                            if (AppCubit.get(context).selectedTable != null)
                              SizedBox(
                                width: double.maxFinite,
                                child: FilledButton(
                                  child: Text('Reserve table'),
                                  onPressed: () {
                                    AppCubit.get(context).occupyTable();
                                  },
                                ),
                              ),
                            40.h,
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class table extends StatelessWidget {
  table({
    super.key,
    required this.imageOccupied,
    required this.imageFree,
    required this.number,
    required this.group,
    required this.status,
  });

  final number;
  final group;
  final imageOccupied;
  final imageFree;
  final status;
  var color;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (AppCubit.get(context).selectedTable == '${group + number}') {
          color = Color.fromARGB(255, 187, 187, 187);
        }
        return InkWell(
            onTap: () {
              if (status == false) {
                print('${group + number}');
                AppCubit.get(context).selectTable('${group + number}');
              }
            },
            child: SizedBox(
              width: 80,
              height: 150,
              child: CircleAvatar(
                backgroundColor: color ??= HexColor("#EDEDED"),
                child: Column(
                  children: [
                    Text('${group}${number}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                    if (status == false) imageFree,
                    if (status == true) imageOccupied,
                    // Text('Your table',
                    //     style: const TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w300,
                    //       color: Colors.deepPurple,
                    //     )),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
