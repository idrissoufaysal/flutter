import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String authorName;
  final String authorImage;
  final String productName;
  final String productImage;
  final double productPrice;

  PostCard({
    required this.authorName,
    required this.authorImage,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(authorImage),
        ),
        title: Text(authorName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(productImage),
            SizedBox(height: 8.0),
            Text(productName),
            SizedBox(height: 8.0),
            Text('Price: \$${productPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}