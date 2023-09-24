import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Dish_Details/dishDetails.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        CollectionReference dishesCollection =
            FirebaseFirestore.instance.collection('dishes');
        dynamic taggedDishesRef = dishesCollection.where('type',
            isEqualTo: AppCubit.get(context).selectedFilter);
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
                        Container(
                          width: 236,
                          height: 40,
                          decoration: BoxDecoration(
                              color: HexColor('6750A4'),
                              borderRadius: BorderRadius.circular(45)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
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
                            Image.network(
                              'https://media.discordapp.net/attachments/1138848453502435368/1153614304147419246/pngtree-sushi-logo-png-image_6552022-removebg-preview.png?width=415&height=415',
                              width: 220,
                              height: 220,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 320,
                                height: 205,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x238B8B8B),
                                        blurRadius: 20,
                                        offset: Offset(0, 4),
                                        spreadRadius: 6,
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fsalmon_sushi.jpg?alt=media&token=55672d35-c838-4e89-ad2a-adbee36e8197',
                                          width: 300,
                                          height: 115,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    20.h,
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Food Name',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '\$ 2.00',
                                            style: TextStyle(
                                              color: Color(0xFF106FDF),
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            40.h,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ActionChip(
                                  backgroundColor:
                                      AppCubit.get(context).appetizerColor,
                                  label: Text('Appetizers'),
                                  onPressed: () {
                                    AppCubit.get(context).selectFilter(1);
                                  },
                                ),
                                4.w,
                                ActionChip(
                                  backgroundColor:
                                      AppCubit.get(context).mainDishColor,
                                  label: Text('Main dishes'),
                                  onPressed: () {
                                    AppCubit.get(context).selectFilter(2);
                                  },
                                ),
                                4.w,
                                ActionChip(
                                  backgroundColor:
                                      AppCubit.get(context).desertsColor,
                                  label: Text('Deserts'),
                                  onPressed: () {
                                    AppCubit.get(context).selectFilter(3);
                                  },
                                ),
                              ],
                            ),
                            20.h,
                            StreamBuilder<QuerySnapshot>(
                                stream: taggedDishesRef.snapshots(),
                                builder: (context, snapshot) {
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

                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 14,
                                      childAspectRatio: .8,
                                    ),
                                    itemCount: querySnapshot.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final DocumentSnapshot<Object?> document =
                                          querySnapshot.docs[index];

                                      return dishCard(
                                        name: document['name'],
                                        price: document['price'],
                                        desc: document['description'],
                                        image: document['image'],
                                      );
                                    },
                                  );
                                }),
                          ],
                        )),
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
