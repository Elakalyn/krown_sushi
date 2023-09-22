import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Host/host.dart';
import 'package:krown_sushi/Modules/Track_Orders/trackOrders.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../cubit/app_cubit.dart';
import '../Menu/menu.dart';

class PickDeliveryOption extends StatelessWidget {
  const PickDeliveryOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: HexColor('6750A4'),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
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
                    const Text(
                      "Pick delivery\noption",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    40.h,
                    SizedBox(
                      width: 231.23,
                      height: 56,
                      child: FilledButton(
                        child: const Text('Pickup',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummary()),
                          );
                        },
                      ),
                    ),
                    20.h,
                    SizedBox(
                      width: 231.23,
                      height: 56,
                      child: FilledButton(
                        child: const Text('Home delivery',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummary()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: HexColor('6750A4'),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
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
                    const Text(
                      "Order summary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    40.h,
                    Container(
                      width: 320,
                      height: 545,
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
                              borderRadius: BorderRadius.circular(15.0),
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
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Food Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          20.h,
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Customizations",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          20.h,
                          Wrap(
                            spacing: 10,
                            children: [
                              Chip(
                                label: Text('Onions'),
                              ),
                              Chip(
                                label: Text('Mushrooms'),
                              ),
                              Chip(
                                label: Text('Olives'),
                              ),
                              Chip(
                                label: Text('Jalapenos'),
                              ),
                            ],
                          ),
                          20.h,
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Fulfilment:",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  8.w,
                                  Text(
                                    "Home Delivery",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.h,
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Quantity:",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  8.w,
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.h,
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  8.w,
                                  Text(
                                    "\$ 8.00",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("106FDF"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.h,
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSuccess()),
                          );
                        },
                        child: const Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    40.h,
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Order Placed\nSuccessfully!",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                40.h,
                Image.network(
                    'https://media.discordapp.net/attachments/673875945198714920/1154801896729628753/delivery.png'),
                40.h,
                SizedBox(
                  height: 48,
                  width: 200,
                  child: FilledButton(
                    child: Text('Track Order'),
                    onPressed: () {
                      AppCubit.get(context).completeOrder(context, 3);
                    },
                  ),
                ),
                20.h,
                SizedBox(
                  height: 48,
                  width: 200,
                  child: FilledButton(
                    child: Text('Menu'),
                    onPressed: () {
                      AppCubit.get(context).completeOrder(context, 1);
                    },
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
