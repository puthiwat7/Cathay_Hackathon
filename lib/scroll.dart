import 'package:cathay_flutter_2/home.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final PageController _pageController = PageController();

  // Image paths for each destination
  final List<String> _imagePaths = [
    'assets/mount_corcovado.jpg', // Image 1
    'assets/golden_gate_bridge.jpg', // Image 2
    'assets/venice.jpg', // Image 3
  ];

  // Titles for each location
  final List<String> _titles = [
    'Mount Corcovado, Brazil',
    'Golden Gate Bridge, San Francisco',
    'Venice, Italy',
  ];

  // Authors for each destination
  final List<String> _authors = [
    'SashaTravel',
    'SamExplorer',
    'AlexWanderlust',
  ];

  // Author images for each destination
  final List<String> _authorImages = [
    'assets/sasha_travel.jpg',      // Image for SashaTravel
    'assets/sam_explorer.jpg',      // Image for SamExplorer
    'assets/alex_wanderlust.jpg',   // Image for AlexWanderlust
  ];

  // Descriptions for each location
  final List<String> _descriptions = [
    'Mount Corcovado, Brazil is a very nice place to go! Especially if you want to hike and enjoy the view of mountains. '
        'I really like it! In Christmas, it gets very lively. Many people come here to see the Christ statue that’s on top.',
    'Golden Gate Bridge, San Francisco is an iconic landmark and a great place to visit. The views are spectacular, '
        'and it’s a perfect spot for a scenic walk or bike ride. Many people come here to experience its beauty at sunset.',
    'Venice, Italy is a city unlike any other with its canals and historic architecture. It’s a wonderful place for a romantic '
        'getaway, and a gondola ride is a must! Every corner of Venice offers a unique charm and experience.',
  ];

  int _currentPage = 0;

  void _scrollUp() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500), // Slower scroll speed
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollDown() {
    if (_currentPage < _imagePaths.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500), // Slower scroll speed
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(), // Top bar with logo
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      Sidebar(), // Sidebar widget on the left
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 500),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite, color: Colors.teal),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close, color: Colors.teal),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add, color: Colors.teal),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                
                                // PageView with images, scrolls vertically
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: AspectRatio(
                                        aspectRatio: 2 / 4, // Maintain vertical aspect ratio
                                        child: PageView.builder(
                                          controller: _pageController,
                                          scrollDirection: Axis.vertical, // Scroll vertically
                                          itemCount: _imagePaths.length,
                                          onPageChanged: (index) {
                                            setState(() {
                                              _currentPage = index;
                                            });
                                          },
                                          itemBuilder: (context, index) {
                                            return Image.asset(
                                              _imagePaths[index],
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.teal,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_upward, size: 30, color: Colors.white),
                                              onPressed: _scrollUp,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.teal,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_downward, size: 30, color: Colors.white),
                                              onPressed: _scrollDown,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 24),
                                
                                // Text and button section
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(_authorImages[_currentPage]), // Display current author's image
                                            radius: 24,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            _authors[_currentPage], // Display current author name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        _titles[_currentPage], // Display current title (location name)
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        _descriptions[_currentPage], // Display current description
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Define action for button here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          child: Text(
                                            'Add to My Plan',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
