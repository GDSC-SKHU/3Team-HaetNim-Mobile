import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('너할일햇님'),
        ),
      // 사이드메뉴 열기
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assetName'),
              ),
            accountName: Text('UserName'),
            accountEmail: Text('UserEmail@gmail.com'),
            onDetailsPressed: (){},
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.only()
            ),
            ),
            ListTile(
              leading: Icon(Icons.perm_contact_cal, color: Colors.orange[700]),
              title: Text('Login'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage()));
                  },
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.orange[700]),
              title: Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MyHomePage()));
                  }
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch, color: Colors.orange[700]),
              title: Text('Rocket'),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => RocketPage())),
              },
              trailing: Icon(Icons.add),
            ),
            ],
          ),
        ),


      // Login 페이지
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            Column(
              children: const <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                // Image( image: AssetImage('assets/haetnim_main.jpeg')),
                Center(child: Icon(Icons.sunny),),
                SizedBox(height:10.0),
                Text('neohallilhaennim'),
              ],
            ),

            // LOGIN FORM
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'UserEmail',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


