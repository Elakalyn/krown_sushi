import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/components.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class TrackOrders extends StatelessWidget {
  TrackOrders({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: NavigationDrawer(
        // onDestinationSelected: handleScreenChanged,
        // selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Krown Sushi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          36.h,
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Main Screens',
              style: Theme.of(context).textTheme.titleMedium,
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
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
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
                  dishProgressCard(),20.h,
                  dishProgressCard(),20.h,
                  dishProgressCard(),
                ]),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
