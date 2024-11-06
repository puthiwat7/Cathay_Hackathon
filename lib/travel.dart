import 'package:cathay_flutter_2/home.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(), // Top bar with logo
              Expanded(
                child: Row(
                  children: [
                    Sidebar(), // Sidebar widget on the left
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Large Header Section
                            Text(
                              "My Travel Plan",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "China, 5-15 January",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 16), // Space below header

                            // Scrollable Itinerary List
                            Expanded(
                              child: ListView(
                                children: [
                                  TravelDay(
                                    date: "5 January",
                                    items: [
                                      TravelItem(
                                        time: "12:00 - 15:00",
                                        title: "Park Trekking with Buddies",
                                        location: "Longgang, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "15:30 - 18:00",
                                        title: "City Museum Visit",
                                        location: "Downtown, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                  TravelDay(
                                    date: "6 January",
                                    items: [
                                      TravelItem(
                                        time: "10:00 - 13:00",
                                        title: "Mountain Hiking",
                                        location: "Nanshan, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "14:00 - 17:00",
                                        title: "Art Gallery Tour",
                                        location: "Downtown, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                  TravelDay(
                                    date: "7 January",
                                    items: [
                                      TravelItem(
                                        time: "08:00 - 12:00",
                                        title: "Beachside Relaxation",
                                        location: "Dameisha, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "13:00 - 15:00",
                                        title: "Boat Ride Adventure",
                                        location: "Shenzhen Bay",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                  // Adding more days and items
                                  TravelDay(
                                    date: "8 January",
                                    items: [
                                      TravelItem(
                                        time: "09:00 - 11:00",
                                        title: "Temple Visit",
                                        location: "Futian, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "13:00 - 16:00",
                                        title: "Shopping Tour",
                                        location: "Luohu Commercial City",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                  TravelDay(
                                    date: "9 January",
                                    items: [
                                      TravelItem(
                                        time: "07:00 - 09:00",
                                        title: "Morning Tai Chi Class",
                                        location: "Lotus Hill Park",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "10:00 - 12:00",
                                        title: "Calligraphy Workshop",
                                        location: "Cultural Center, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "15:00 - 17:00",
                                        title: "Sunset Walk",
                                        location: "Shenzhen Bay Park",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                  TravelDay(
                                    date: "10 January",
                                    items: [
                                      TravelItem(
                                        time: "08:00 - 11:00",
                                        title: "Cooking Class",
                                        location: "Futian, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                      TravelItem(
                                        time: "13:00 - 15:00",
                                        title: "Tea Ceremony Experience",
                                        location: "Nanshan, Shenzhen",
                                        imagePath: 'assets/sample_image.jpg',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Floating Chat Icon
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Define action here
              },
              backgroundColor: Color(0xFF2A8D8D),
              child: Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TravelDay extends StatelessWidget {
  final String date;
  final List<TravelItem> items;

  TravelDay({required this.date, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.teal),
                onPressed: () {
                  // Define add action here
                },
              ),
            ],
          ),
          Column(
            children: items,
          ),
        ],
      ),
    );
  }
}

class TravelItem extends StatelessWidget {
  final String time;
  final String title;
  final String location;
  final String imagePath;

  TravelItem({
    required this.time,
    required this.title,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            SizedBox(height: 4),
            Text(location),
          ],
        ),
      ),
    );
  }
}

// Sidebar, SidebarIcon, and TopBar classes go here, same as before.
