import 'package:flutter/material.dart';

import 'package:pawscare/models/Pet.dart';

class PetWidget extends StatelessWidget {
  final Pet pet;

  PetWidget({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${pet.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text("Type: ${pet.type.toString().split('.').last}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Breed: ${pet.breed}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Age: ${pet.age} years", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("About: ${pet.about}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
void main() {
  Pet myPet = Pet(
    name: "Buddy",
    type: PetType.Dog,
    breed: "Golden Retriever",
    age: 3,
    about: "Friendly and playful dog.",
  );

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pet Information'),
        ),
        body: Center(
          child: PetWidget(pet: myPet),
        ),
      ),
    ),
  );
}