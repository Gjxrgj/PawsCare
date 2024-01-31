import 'package:flutter/material.dart';

import 'package:pawscare/models/Pet.dart';

class CreatePetWidget extends StatefulWidget {
  final Function(Pet) onPetCreated;

  CreatePetWidget({required this.onPetCreated});

  @override
  _CreatePetWidgetState createState() => _CreatePetWidgetState();
}

class _CreatePetWidgetState extends State<CreatePetWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  PetType _selectedPetType = PetType.Dog;
  TextEditingController _breedController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _selectedPetType,
                items: PetType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPetType = value as PetType;
                  });
                },
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: 'Breed'),
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: _aboutController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'About'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Validation passed, create the pet object
                    Pet newPet = Pet(
                      name: _nameController.text,
                      type: _selectedPetType,
                      breed: _breedController.text,
                      age: int.tryParse(_ageController.text) ?? 0,
                      about: _aboutController.text,
                    );

                    // Call the callback function with the created pet
                    widget.onPetCreated(newPet);

                    // Clear the form
                    _formKey.currentState?.reset();
                  }
                },
                child: Text('Create Pet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  List<Pet> _petList = [];
  runApp(
    MaterialApp(
      home: CreatePetWidget(
        onPetCreated: (createdPet) {
          // Do something with the created pet, such as saving to a database
          _petList.add(createdPet);
          for (Pet pet in _petList) {
            print('Pet Information:');
            print('Name: ${pet.name}');
            print('Type: ${pet.type}');
            print('Breed: ${pet.breed}');
            print('Age: ${pet.age} years');
            print('About: ${pet.about}');
            print('-----------------------------');
          }
        },
      ),
    ),
  );
}
