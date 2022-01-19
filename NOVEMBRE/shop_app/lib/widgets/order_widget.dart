import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:intl/intl.dart';

class OrdersItems extends StatefulWidget {
  final Orders productOrder;

  const OrdersItems({Key key, @required this.productOrder}) : super(key: key);

  @override
  _OrdersItemsState createState() => _OrdersItemsState();
}

class _OrdersItemsState extends State<OrdersItems> {
  final df = DateFormat('dd-MM-yyyy hh:mm a');

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          ListTile(
              title: Text("Total: ${widget.productOrder.amount} CFA"),
              subtitle: Text("Date: ${df.format(widget.productOrder.date)}"),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  icon:
                      Icon(expanded ? Icons.expand_less : Icons.expand_more))),
          if (expanded)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView(
                children: widget.productOrder.productItem
                    .map((prod) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(prod.image),
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(prod.title),
                              subtitle:
                                  Text("${prod.quantity} x ${prod.price} CFA"),
                            ),
                            const Divider(),
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
