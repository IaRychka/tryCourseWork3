import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String zodiacSign;
  final String date;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  ArticleDetailPage({
    required this.title,
    required this.content,
    required this.zodiacSign,
    required this.date,
    required this.imageUrl,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {

    final List<String> sentences = content.split('.');
    final String firstParagraph = '${sentences.take(4).join('.')}.';
    final String secondParagraph = '${sentences.skip(4).join('.')}.';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 77, 70, 170),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? const Color.fromARGB(255, 55, 0, 253) : Colors.grey,
            ),
            onPressed: onToggleFavorite,
          ),
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Дата: $date',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            Text(
              'Знак зодиака: $zodiacSign',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              firstParagraph,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              secondParagraph,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}