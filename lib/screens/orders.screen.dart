import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../Providers/orders.dart' show Orders;
import '../widgets/order_item.dart' as ord;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your ORders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => ord.OrderItem(orderData.orders[i]),
      ),
      drawer: AppDrawer(),
    );
  }
}
