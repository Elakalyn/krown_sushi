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
  PickDeliveryOption({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
     this.list,
  });

  final name;
  final image;
  final desc;
  final price;
  var list;
  List emptyList = [];

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
                                builder: (context) => OrderSummary(
                                      name: name,
                                      price: price,
                                      desc: desc,
                                      image: image,
                                      delivery: 'Pickup',
                                      list: list ??= emptyList,
                                    )),
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
                                builder: (context) => OrderSummary(
                                      name: name,
                                      price: price,
                                      desc: desc,
                                      image: image,
                                      delivery: 'Home Delivery',
                                      list: list ??= emptyList,
                                    )),
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
  OrderSummary({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.delivery,
    required this.list,
  });

  final list;
  final name;
  final image;
  final desc;
  final price;
  final delivery;
  int quantity = 1;
  late double height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        if (list.length > 0) {
          height = 491;
        } else {
          height = 405;
        }
        return Scaffold(
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
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: HexColor('6750A4'),
                            child: const Icon(Icons.arrow_back,
                                color: Colors.white),
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
                          height: height,
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
                                    image,
                                    width: 300,
                                    height: 115,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              20.h,
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              20.h,
                              if (list.length > 0)
                                Column(
                                  children: [
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
                                    SizedBox(
                                      height: 50,
                                      child: ListView.separated(
                                        itemBuilder: (context, index) => Chip(label: Text(list[index])),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) => 5.w,
                                        itemCount: list.length,
                                        scrollDirection: Axis.horizontal,
                                       
                                        ),
                                    ),
                                    20.h,
                                  ],
                                ),
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
                                        delivery,
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
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: ShapeDecoration(
                                              color: HexColor('6750A4'),
                                              shape: const OvalBorder(),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              quantity++;
                                              AppCubit.get(context)
                                                  .emit(ScreenChanged());
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      8.w,
                                      Text(
                                        quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      8.w,
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: ShapeDecoration(
                                              color: HexColor('6750A4'),
                                              shape: const OvalBorder(),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (quantity != 0) {
                                                quantity--;
                                                AppCubit.get(context)
                                                    .emit(ScreenChanged());
                                              }
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
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
                                        "\$ $price",
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
                              AppCubit.get(context).makeOrder(
                                context: context,
                                customizations: list,
                                quantity: quantity,
                                delivery: delivery,
                                fulfillment: 'Processing',
                                name: name,
                                price: price,
                                image: image,
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
      },
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
                      Navigator.pop(context);
                      Navigator.pop(context);
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
