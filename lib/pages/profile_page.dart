import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(title: Text('Profile Page'), centerTitle: true),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 20,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.person_outline, size: 40),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: John Snow',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Age: 25',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Address: Biratnagar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.black, thickness: 1.5),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.public),
                      SizedBox(
                        height: 18,
                        child: VerticalDivider(
                          width: 20,
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'https://www.google.com',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail_outline),
                      SizedBox(
                        height: 18,
                        child: VerticalDivider(
                          width: 20,
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      Text('rahul@gmail.com', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
