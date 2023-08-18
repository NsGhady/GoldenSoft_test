import 'package:flutter/material.dart';

class Order {
  final String restaurantName;
  final String restaurantLogo;
  final String orderID;
  final double distance;
  final String userName;
  final String date;
  final String details;

  Order({
    required this.restaurantName,
    required this.restaurantLogo,
    required this.orderID,
    required this.distance,
    required this.userName,
    required this.date,
    required this.details,
  });
}

class OrdersView extends StatelessWidget {
  final List<Order> orders = [
    Order(
      restaurantName: 'Pizza Palace',
      restaurantLogo: 'assets/images/pizza_palace.png',
      orderID: '123',
      distance: 2.5,
      userName: 'John Doe',
      date: '2023-08-18',
      details: '1 Pepsi and 2 Chicken Sandwiches',
    ),
    Order(
      restaurantName: 'Burger Joint',
      restaurantLogo: 'assets/images/burger_joint.png',
      orderID: '1234',
      distance: 1.2,
      userName: 'Jane Smith',
      date: '2023-08-17',
      details: '1 Coke and 1 Cheeseburger',
    ),
  ];

  OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.green),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.green,
            ),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(order.restaurantLogo),
                    title: Text(order.restaurantName),
                    subtitle: Text(
                        '${order.distance} km away from your location\nOrder ID: ${order.orderID}'),
                  ),
                  ListTile(
                    title: Text('Order by ${order.userName}'),
                    subtitle: Text('Date of order: ${order.date}'),
                  ),
                  ListTile(
                    title: const Text('Order Details'),
                    subtitle: Text(order.details),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          onPressed: () {},
                          child: const Text(
                            'Details',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Confirm Order'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
