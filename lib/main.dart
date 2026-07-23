import 'package:flutter/material.dart';

void main() {
  runApp(const MyStreamingApp());
}

class MyStreamingApp extends StatelessWidget {
  const MyStreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream App',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> movies = [
    {"title": "Movie 1", "image": "https://via.placeholder.com/300x450"},
    {"title": "Movie 2", "image": "https://via.placeholder.com/300x450"},
    {"title": "Movie 3", "image": "https://via.placeholder.com/300x450"},
    {"title": "Movie 4", "image": "https://via.placeholder.com/300x450"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TV & Mobile Streaming')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            // Focus widget TV remote (D-Pad) navigation handle karta hai
            return Focus(
              autofocus: index == 0,
              builder: (context, hasFocus) {
                return GestureDetector(
                  onTap: () {
                    // Video Play Logic Here
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: hasFocus ? Colors.amber : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        movies[index]["title"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: hasFocus ? 18 : 14,
                          fontWeight: hasFocus ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
