import 'package:cruv_task/widgets/cabin.dart';
import 'package:cruv_task/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //to remove renderpixel flow
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                // heading
                "Seat Finder",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(), //search bar for finding seat number
              const SizedBox(
                height: 20,
              ),
              // Cabin widget is a group of 8 seats in one cabin
              const CabinWidget(index: 0),
              const CabinWidget(index: 1),
              const CabinWidget(index: 2),
              const CabinWidget(index: 3),
              const CabinWidget(index: 4),
            ],
          ),
        ),
      ),
    );
  }
}
