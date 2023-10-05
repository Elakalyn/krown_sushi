import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Search/search.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Constants/constants.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        dynamic ordersCollection = FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .collection('orders').where('fulfillment', isEqualTo: 'Delivered');
        dynamic ordersRef = ordersCollection;
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
                    child: Column(children: [
                      40.h,
                      Row(children: [
                        Text(
                          "Order History",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Spacer(),
                      ]),
                      20.h,
                      StreamBuilder<QuerySnapshot>(
                        stream: ordersRef.snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          final QuerySnapshot? querySnapshot = snapshot.data;

                          if (querySnapshot == null) {
                            print('DATA DOES NOT EXIST.');
                            return Text(
                              'No data available',
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot<Object?> document =
                                  querySnapshot.docs[index];
                              late double progress;
                              switch (document['fulfillment']) {
                                case 'Processing':
                                  progress = 50;
                                  break;
                                case 'Preparing':
                                  progress = 100;
                                  break;
                                case 'Cooking':
                                  progress = 150;
                                  break;
                                case 'Packaging':
                                  progress = 230;
                                  break;
                                case 'Delivered':
                                  progress = 300;
                                  break;
                              }

                              return dishProgressCard(
                                name: document['name'],
                                image: document['image'],
                                status: document['fulfillment'],
                                progress: progress,
                              );
                            },
                            separatorBuilder: (context, index) => 20.h,
                            itemCount: querySnapshot.docs.length,
                            physics: NeverScrollableScrollPhysics(),
                          );
                        },
                      ),
                    ]),
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
