import 'package:flutter/material.dart';
import 'package:qr_scanner/qr_scanner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text(
            'Anasayfa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 10, 59, 116),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScanner()),
                );
              },
              child: Image.asset(
                'assets/images/qr.jpeg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Okutmak için tıklayın',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 59, 116)),
            ),
          ],
        ),
      ),
    );
  }
}
