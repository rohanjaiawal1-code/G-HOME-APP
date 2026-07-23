import 'package:flutter/material.dart';

void main() {
  runApp(const GHomeApp());
}

class GHomeApp extends StatelessWidget {
  const GHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G-HOME TV',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        primaryColor: Colors.amber,
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final List<Map<String, String>> mediaList = [
    {"title": "Hubstream Stream", "type": "hubstream", "url": "https://hubstream.art"},
    {"title": "HDStream4U Stream", "type": "hdstream", "url": "https://hdstream4u.com"},
    {"title": "YouTube Stream", "type": "youtube", "url": "https://youtube.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G-HOME ENTERPRISE STREAMING'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: mediaList.length,
          itemBuilder: (context, index) {
            // Using InkWell with automatic focus and highlight states for TV/Desktop/Mobile
            return InkWell(
              onTap: () {
                // Handle Video Play Logic Here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    mediaList[index]["title"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
