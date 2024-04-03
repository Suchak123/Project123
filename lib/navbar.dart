import 'package:flutter/material.dart';
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('exotic fruits', style: TextStyle(color: Colors.black)),
            accountEmail: Text('rs9954651@gmail.com', style: TextStyle(color: Colors.black,)),
            currentAccountPicture: CircleAvatar(
              child:ClipOval(
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/003/277/098/non_2x/fresh-fruits-logo-template-healthy-nature-free-vector.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,

                ),
              ) ,
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/big-composition-different-colorful-tropical-fruits-big-composition-different-colorful-tropical-fruits-isolated-white-165900680.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text('My account'),
            onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.favorite_border_rounded),
            title: Text('favorites'),
            onTap: ()=> null,
          ),

          ListTile(
            leading: Icon(Icons.notification_important_rounded),
            title: Text('notifications'),
            onTap: ()=> null,
            trailing: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child:Center(
                child: Text('3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank_rounded),
            title: Text('My Order'),
            onTap: ()=> null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_applications_rounded),
            title: Text('Settings'),
            onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.star_border_purple500_rounded),
            title: Text('About us'),
            onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text('Exit'),
            onTap: ()=> null,
          ),
        ],
      ),
    );
  }
}



