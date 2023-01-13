import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
// import 'package:untitled1/todo.dart';
import 'table_calender.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, 
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light, 
      primarySwatch: Colors.orange,
      accentColor: Color.fromARGB(255, 255, 204, 0)),
  ),
  home: MyHomePage(),
));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _DataTimeEditingController = TextEditingController();
  final TextEditingController _EstimatedEditingController = TextEditingController();

  DateTime? tempPickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('너할일햇님'),
        // actions:const [Image(image: AssetImage('android/assets/sun.png')),]
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: () {},
            ),
          ]
        ),

      // drawer(사이드바 메뉴)
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
                  builder: (context1) => MyHomePage()));
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

      // Calendar View + Todo View
      body: CalendarPage(),
          // ShowTodo() //todolist 보여주는 클래스 구현하기
    );
  }

}
