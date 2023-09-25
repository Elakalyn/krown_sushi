// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Search/search.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CollectionReference dishesCollection =
            FirebaseFirestore.instance.collection('dishes');
        dynamic dishesRef = dishesCollection;
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Current Order',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          20.h,
                          dishProgressCard(),
                          40.h,
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Try something new?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          20.h,
                          StreamBuilder<QuerySnapshot>(
                            stream: dishesRef.snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              final QuerySnapshot? querySnapshot =
                                  snapshot.data;

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

                                 return suggestionDishCard(
                                    name: document['name'],
                                    desc: document['description'],
                                    image: document['image'],
                                    price: document['price'],
                                  );
                                },
                                separatorBuilder: (context, index) => 20.h,
                                itemCount: querySnapshot.docs.length,
                                physics: NeverScrollableScrollPhysics(),
                              );
                            },
                          ),
                          40.h,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
