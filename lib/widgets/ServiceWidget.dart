import 'package:flutter/material.dart';

import '../models/Service.dart';


class ServiceWidget extends StatelessWidget {
  final Service service;

  ServiceWidget({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service Name: ${service.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Description: ${service.description}"),
            Text("Price: \$${service.price.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
void main() {
  Service myService = Service(
    name: "Petko",
    description: "Shetam kuchinja",
    price: 25.99,
  );

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Service Information'),
        ),
        body: Center(
          child: ServiceWidget(service: myService),
        ),
      ),
    ),
  );
}
