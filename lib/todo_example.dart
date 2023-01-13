import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/login.dart';


// StatefulWidget 상속받는 TodoPage 클래스 생성
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

// State<TodoPage>을 상속받는 _TodoPageState private 클래스 생성
class _TodoPageState extends State<TodoPage> {
  List<String> todos = []; //리스트 선언
  String input = "";
  
  //리스트의 이름(추가할 todo) String 선언
  @override
  void initState() {
    super.initState();
    todos.add("18:10 GDSC 세션");
    todos.add("미니 프로젝트 완성하기");
  }

  // material design = 구글 디자인 컨셉
  @override
  Widget build(BuildContext context) {
    return Scaffold(  //Scaffold는 appBar, body라는 옵션
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
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.orange[700]),
              title: Text('Todo'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TodoPage()));
              },
              trailing: Icon(Icons.add),
            ),
            ],
          ),
        ),

    

    floatingActionButton: FloatingActionButton( //추가 버튼
    hoverColor: Colors.orange, 
      onPressed: () { 
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Add Todolist"),
              content: TextField(
                onChanged: (String value) {
                  input = value; //string 직접 작성
                }),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      todos.add(input);
                    });
                    Navigator.of(context).pop(); //input 입력후 창닫힘
                  }, 
                  child: Text("Add"))
                ]
              );
            });
        },
      child: Icon(Icons.add),
    ),

    //body
    // ListView에 사용할 List를 정해두고, itemBuilder를 사용하여
    //item을 itemcount에 맞춰서 ListView를 구성하기만 하면 됩니다.
    //ListView.builder를 사용하는 이유는 화면에 보여지는 리스트들 그때그때 마다 호출하기 위해 사용합니다.
    //보이는 부분만 불러오기 때문에 ListView보다 효율적으로 화면을 구성할 수 있습니다.
    body: Center( child: ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible( //삭제 기능 추가
          key: Key(todos[index]), 
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile( // == ListView
              title: Text(todos[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.grey),
                onPressed: () { setState(() {
                  todos.removeAt(index);
                  });
                })),
            ));
        }),
      ),
    );
  }
}
