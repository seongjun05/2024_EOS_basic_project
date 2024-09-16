
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EOS ToDoList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home:const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.lightGreen,
      title: Text('Eos ToDoList'),
      leading: Icon(Icons.check_box),
    ),
        body: Container(
          color: Colors.lightGreen.withOpacity(0.3),
          height: 200,
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 10, color: Colors.grey ),
                ),
                child: Icon(
                  Icons.person, color: Colors.grey,size: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("EOS"),
                  Text("이성준", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text("에오스 화이팅"),
                ],
              )
            ],
          ),
        )
    );
  }
}
