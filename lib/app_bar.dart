import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Dashboard',
        style: TextStyle(fontFamily: 'DynaPuff'),
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String result) {
            _handleMenuSelection(result, context);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'CallCenter',
              child: Text('Call Center', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
            const PopupMenuItem<String>(
              value: 'SMSCenter',
              child: Text('SMS Center', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
            const PopupMenuItem<String>(
              value: 'Maps',
              child: Text('Maps', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
            const PopupMenuItem<String>(
              value: 'UpdateUser',
              child: Text('Update Profile', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: Text('Logout', style: TextStyle(fontFamily: 'DynaPuff')),
            ),
          ],
        ),
      ],
    );
  }

  void _handleMenuSelection(String result, BuildContext context) {
    switch (result) {
      case 'CallCenter':
        _makeWhatsAppCall('+6285156504046', context);
        break;
      case 'SMSCenter':
        _sendWhatsAppMessage('+6285156504046', context);
        break;
      case 'Maps':
        _launchMaps('https://www.google.com/maps', context);
        break;
      case 'UpdateUser':
        Navigator.pushNamed(context, '/update-user');
        break;
      case 'Profile':
        Navigator.pushNamed(context, '/profile');
        break;
      case 'Logout':
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
              (Route<dynamic> route) => false,
        );
        break;
    }
  }

  Future<void> _makeWhatsAppCall(String phoneNumber, BuildContext context) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunch(whatsappUri.toString())) {
      await launch(whatsappUri.toString());
    } else {
      _showSnackBar(context, 'Could not launch WhatsApp');
    }
  }

  Future<void> _sendWhatsAppMessage(String phoneNumber, BuildContext context) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber?text=Hallo, Saya Ingin Memesan Burger Wekidi...');
    if (await canLaunch(whatsappUri.toString())) {
      await launch(whatsappUri.toString());
    } else {
      _showSnackBar(context, 'Could not send message via WhatsApp');
    }
  }

  Future<void> _launchMaps(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackBar(context, 'Could not launch Maps');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
