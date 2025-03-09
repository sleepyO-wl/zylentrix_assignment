import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Fetch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List posts = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print('Response received with status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        setState(() {
          posts = json.decode(response.body);
          isLoading = false;
        });
        print('Posts fetched successfully, total: ${posts.length}');
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Building PostListScreen');
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(errorMessage,
                      style: const TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    print('Building ListTile for post ${index + 1}');
                    return ListTile(
                      title: Text(posts[index]['title']),
                    );
                  },
                ),
    );
  }
}
