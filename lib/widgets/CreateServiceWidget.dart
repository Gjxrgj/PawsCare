import 'package:flutter/material.dart';
import 'package:pawscare/models/Service.dart';

class CreateServiceWidget extends StatelessWidget {
  final Function(Service) onServiceCreated;

  CreateServiceWidget({required this.onServiceCreated});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Service Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Validation passed, create the service object
                    Service newService = Service(
                      name: _nameController.text,
                      description: _descriptionController.text,
                      price: double.parse(_priceController.text),
                    );

                    // Call the callback function with the created service
                    onServiceCreated(newService);

                    // Clear the form
                    _formKey.currentState?.reset();
                  }
                },
                child: Text('Create Service'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void main() {
  List<Service> _serviceList = [];

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create and Display Service'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CreateServiceWidget(
                  onServiceCreated: (createdService) {
                    // Do something with the created service, such as saving to a database
                    _serviceList.add(createdService);
                    for (Service service in _serviceList) {
                      print('service Information:');
                      print('Name: ${service.name}');
                      print('Description: ${service.description}');
                      print('Price: ${service.price}');
                      print('-----------------------------');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
