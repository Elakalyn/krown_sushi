import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:krown_sushi/Modules/Search/search.dart';

class TableReservation extends StatelessWidget {
  TableReservation({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                                builder: (context) => SearchScreen()),
                          );
                          },
                          child: CircleAvatar(
                            child: const Icon(Icons.search, color: Colors.white),
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
                      child: Column(
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
                              Chip(
                                label: Text('17/9/2023 9:30 PM'),
                              ),
                            ],
                          ),
                          40.h,
                          Container(
                            width: 320,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: HexColor('#FF6D4E'),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x238B8B8B),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                    spreadRadius: 6,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  5.w,
                                  table(),
                                  Spacer(),
                                  table(),
                                  Spacer(),
                                  table(),
                                    5.w,
                                ],
                              ),
                            ),
                          ),
                          10.h,
                          Container(
                            width: 320,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x238B8B8B),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                    spreadRadius: 6,
                                  )
                                ]),
                          ),
                          10.h,
                          Container(
                            width: 320,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x238B8B8B),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                    spreadRadius: 6,
                                  )
                                ]),
                          ),
                          10.h,
                          Container(
                            width: 320,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x238B8B8B),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                    spreadRadius: 6,
                                  )
                                ]),
                          ),
                          40.h,
                          SizedBox(
                            width: double.maxFinite,
                            child: FilledButton(
                              child: Text('No table selected.'),
                              onPressed: null,
                            ),
                          ),
                          40.h,
                        ],
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
