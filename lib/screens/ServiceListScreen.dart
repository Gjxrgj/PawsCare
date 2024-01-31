import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawscare/models/Service.dart';
import 'package:pawscare/widgets/CreateServiceWidget.dart';
import 'package:pawscare/widgets/ServiceWidget.dart';

class ServiceListScreen extends StatefulWidget {
  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  List<Service> _serviceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openCreateServiceWidget(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _serviceList.length,
        itemBuilder: (context, index) {
          return ServiceWidget(service: _serviceList[index]);
        },
      ),
    );
  }

  void _openCreateServiceWidget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CreateServiceWidget(
          onServiceCreated: (createdService) {
            setState(() {
              // Update the service list
              _serviceList.add(createdService);
            });
            // Close the bottom sheet
            Navigator.pop(context);
          },
        );
      },
    );
  }
}