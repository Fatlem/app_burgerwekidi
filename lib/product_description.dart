import 'package:flutter/material.dart';
import 'product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(fontFamily: 'DynaPuff'), // Use custom font
        ),
        backgroundColor: Color(0xFF8D6E63), // Burger-themed color
      ),
      body: Stack(
        children: [
          // Fullscreen image with slight upward shift
          Positioned(
            top: -40, // Adjusted upward position of the image
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)), // Rounded corners for the image
              child: Image.asset(
                product.imageUrl, // Use the image from assets
                fit: BoxFit.cover, // Maintain image aspect ratio
                height: 360, // Slightly increased height for better visibility
              ),
            ),
          ),
          // Overlay with padding for description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                SizedBox(height: 300), // Space for the image
                // Displaying the product description container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // Slightly less transparent for better visibility
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        blurRadius: 10, // Soft shadow
                        offset: Offset(0, 5), // Position of the shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0), // Padding for text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'DynaPuff', // Use custom font
                          color: Colors.brown[600], // Color to match theme
                        ),
                      ),
                      SizedBox(height: 12.0), // More space before the price
                      Text(
                        'Rp ${product.price}', // Displaying the price
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DynaPuff', // Use custom font
                          color: Colors.green[700], // Color to match theme
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFCC80), // Matching burger-inspired background
    );
  }
}
