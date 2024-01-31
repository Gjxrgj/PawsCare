import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawscare/models/Pet.dart';
import 'package:pawscare/widgets/CreatePetWidget.dart';
import 'package:pawscare/widgets/PetWidget.dart';

class PetListScreen extends StatefulWidget {
  @override
  _PetListScreenState createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  List<Pet> _petList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Open the CreatePetWidget to add a new pet
              _openCreatePetWidget(context);
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
        itemCount: _petList.length,
        itemBuilder: (context, index) {
          return PetWidget(pet: _petList[index]);
        },
      ),
    );
  }

  void _openCreatePetWidget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CreatePetWidget(
          onPetCreated: (createdPet) {
            setState(() {
              // Update the pet list
              _petList.add(createdPet);
            });

            // Close the bottom sheet
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
