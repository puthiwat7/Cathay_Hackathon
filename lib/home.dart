import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Hong Kong',
      'image': 'assets/hong_kong.jpg',
      'description': 'Hong Kong is a vibrant metropolis where modern skyscrapers meet traditional temples, creating a unique blend of Eastern heritage and Western influence.',
    },
    {
      'name': 'Japan',
      'image': 'assets/japan.jpg',
      'description': 'Japan is known for its rich history, beautiful temples, and futuristic cities. The country offers a unique mix of tradition and innovation.',
    },
    {
      'name': 'Indonesia',
      'image': 'assets/indonesia.jpg',
      'description': 'Indonesia is a tropical paradise with over 17,000 islands. It\'s renowned for its beaches, volcanoes, and diverse cultures.',
    },
    {
      'name': 'China',
      'image': 'assets/china.jpg',
      'description': 'China is home to some of the world\'s most ancient civilizations. From the Great Wall to the Terracotta Warriors, it offers vast historical treasures.',
    },
    {
      'name': 'Thailand',
      'image': 'assets/thailand.jpg',
      'description': 'Thailand is famous for its stunning beaches, vibrant cities, and exquisite temples. It\'s a top destination for culture, relaxation, and adventure.',
    },
    {
      'name': 'South Korea',
      'image': 'assets/south_korea.jpg',
      'description': 'South Korea offers a dynamic blend of modern technology and ancient tradition, with beautiful landscapes and bustling cities like Seoul.',
    },
    {
      'name': 'Vietnam',
      'image': 'assets/vietnam.jpg',
      'description': 'Vietnam is known for its breathtaking landscapes, historical sites, and vibrant street markets filled with delicious local food.',
    },
    {
      'name': 'Singapore',
      'image': 'assets/singapore.jpg',
      'description': 'Singapore is a modern city-state known for its cleanliness, impressive skyline, and vibrant multicultural lifestyle.',
    },
    {
      'name': 'Philippines',
      'image': 'assets/philippines.jpg',
      'description': 'The Philippines offers some of the world\'s most beautiful beaches, clear blue waters, and a rich cultural heritage.',
    },
    {
      'name': 'Malaysia',
      'image': 'assets/malaysia.jpg',
      'description': 'Malaysia is a cultural melting pot with influences from Malay, Chinese, and Indian cultures. It\'s known for its diverse food scene and stunning landscapes.',
    },
    {
      'name': 'United States',
      'image': 'assets/usa.jpg',
      'description': 'The United States offers a variety of attractions, from bustling cities like New York to natural wonders like the Grand Canyon and Yellowstone National Park.',
    },
    {
      'name': 'United Arab Emirates',
      'image': 'assets/uae.jpg',
      'description': 'The UAE is known for its luxury shopping, ultramodern architecture, and lively nightlife. Dubai and Abu Dhabi are top travel destinations in the region.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(),
              Expanded(
                child: Row(
                  children: [
                    Sidebar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'All Around the World',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Horizontally Scrollable Grid of Destinations with Two Equal Rows
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 1.5, // Adjust width as needed
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        alignment: WrapAlignment.start,
                                        children: destinations.map((destination) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DestinationDetailPage(
                                                    name: destination['name']!,
                                                    image: destination['image']!,
                                                    description: destination['description']!,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.3, // Each item width
                                              height: 180,
                                              child: DestinationCard(
                                                name: destination['name']!,
                                                image: destination['image']!,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
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
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFF2A8D8D),
              child: Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const DestinationDetailPage({required this.name, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: Color(0xFF2A8D8D),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SidebarIcon(
            icon: Icons.home,
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
          SidebarIcon(
            icon: Icons.flight_takeoff,
            onPressed: () {},
          ),
          SidebarIcon(
            icon: Icons.location_on,
            onPressed: () {
              Navigator.pushNamed(context, '/travelpage');
            },
          ),
          SidebarIcon(
            icon: Icons.music_note,
            onPressed: () {},
          ),
          SidebarIcon(
            icon: Icons.tv,
            onPressed: () {
              Navigator.pushNamed(context, '/scrollpage');
            },
          ),
          SidebarIcon(
            icon: Icons.search,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SidebarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  SidebarIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/cathay_logo.jpg',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 8),
              const Text(
                'Cathay Pacific',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.settings, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle, size: 30),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String name;
  final String image;

  const DestinationCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
