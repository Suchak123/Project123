

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Profile'),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.person)),
        ],
      ),
      body: ListView(

      )
    );
  }
}
