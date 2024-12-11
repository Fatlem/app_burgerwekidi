import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUser extends StatefulWidget {
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk memuat data pengguna dari SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    });
  }

  // Fungsi untuk menyimpan data pengguna ke SharedPreferences
  Future<void> _updateUserData() async {
    final String name = _nameController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Mengakses SharedPreferences dan menyimpan data pengguna
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('username', username);
    await prefs.setString('password', password);

    // Menampilkan SnackBar sebagai konfirmasi bahwa data berhasil diupdate
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Name, Username, dan Password berhasil diupdate!'),
        backgroundColor: Colors.brown,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User & Password', style: TextStyle(fontFamily: 'DynaPuff')),
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
                  'Update Your Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DynaPuff',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Update your name, username, and password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown[700],
                    fontFamily: 'DynaPuff',
                  ),
                ),
                SizedBox(height: 30),
                // Field untuk nama
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.brown),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.brown[600], fontFamily: 'DynaPuff'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                // Field untuk username (tidak hidden)
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.brown),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.brown[600], fontFamily: 'DynaPuff'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.brown),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.brown[600], fontFamily: 'DynaPuff'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: _updateUserData,
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 18, fontFamily: 'DynaPuff'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
