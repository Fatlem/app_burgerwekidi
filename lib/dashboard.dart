import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'product_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // Add a Container to wrap the column and set its color to transparent
          color: Colors.transparent, // Make the background transparent
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tempat Makan Yang Paling Enak Itu Cuma Ada Disini',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800], // Warm color for the title
                  fontFamily: 'DynaPuff', // Font to match the theme
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Wekidiくん Merupakan Restoran Fast Food Yang Baru Saja Buka Pada Tanggal 01/11/2022 Di Isekai. Dengan Produk Unggulan Berupa Burger Bernama Melted LOL Burger, Wekidiくん Hingga Saat Ini Baru Memiliki Ratusan Cabang Restoran Di Isekai Tersebar Lebih Dari 20 Negara, Salah Satunya Tempest.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown[600], // Softer shade for the subtitle
                  fontFamily: 'DynaPuff', // Font to match the theme
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/PaimonWekidi.png', // Ensure the path is correct
                    width: 380,
                    height: 380,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8D6E63), // Brownish color for the button
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // More rounded corners
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductList(),
                      ),
                    );
                  },
                  child: Text(
                    'Menu Produk',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'DynaPuff'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFCC80), // Matching burger-inspired background
    );
  }
}
