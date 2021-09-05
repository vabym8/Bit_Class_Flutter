import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            Text(
              'Saitama',
              style: GoogleFonts.montserrat(fontSize: 30.0),
            ),
            Text(
              'Hero Rank S',
              style: GoogleFonts.pacifico(fontSize: 20.0),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  '+91 9876543210',
                  style: GoogleFonts.lato(fontSize: 20.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'saitama@onepunchman.com',
                  style: GoogleFonts.lato(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
