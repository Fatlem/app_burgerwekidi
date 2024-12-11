import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _name = '';
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Fungsi untuk memuat data pengguna dari SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _username = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontFamily: 'DynaPuff')),
        backgroundColor: Color(0xFF8D6E63),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFCC80), Color(0xFFFFAB40)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.brown,
                  size: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'Profile Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DynaPuff',
                  ),
                ),
                SizedBox(height: 30),
                _buildProfileField('Name', _name),
                SizedBox(height: 10), // Ruang lebih sedikit antara field
                _buildProfileField('Username', _username),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan field profil
  Widget _buildProfileField(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.brown[600], fontFamily: 'DynaPuff', fontSize: 18),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.brown[800], fontFamily: 'DynaPuff', fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
