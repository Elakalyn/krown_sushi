import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:krown_sushi/Modules/Search/search.dart';

class TrackOrders extends StatelessWidget {
  TrackOrders({super.key});
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(children: [
                      40.h,
                      Row(
                        children: [
                          Text(
                            "Track your \n  Orders",
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          20.w,
                        ],
                      ),
                      20.h,
                      dishProgressCard(),
                      20.h,
                      dishProgressCard(),
                      20.h,
                      dishProgressCard(),
                    ]),
                  )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
