import 'package:eos_todolist1/widgets/add_button.dart';
import 'package:eos_todolist1/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoList = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoList.add("1111111");
    toDoList.add("2222222");
    toDoList.add("3333333");
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
      title: Text('Eos ToDoList'),
      leading: Image.asset('assets/images/eos_logo.png.png'),
    ),
        body: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 10, color: Colors.grey),
                          borderRadius: BorderRadius.circular(200)
                      ),
                      child: Center(
                          child: Image.asset('assets/images/eos_logo.png.png')
                      )
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("이성준", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 15),
                          Text("화이팅"),
                        ],
                      ))
                ],
              ),
            ),
              Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),),
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Color(0xFFA4C639).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Center(
                      child: Text(
                        "To do list",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 80, left: 40, right: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height - 400,
                    child:ListView.builder(
                        itemCount: toDoList.length,
                        itemBuilder: (BuildContext context,int index) {
                          return ToDoItem(title: toDoList[index], onDelete: (){
                            setState(() {
                              toDoList.removeAt(index);
                            });
                          });
                        },
                        ) ,
                ),),
                Positioned(
                  bottom: 30,
                    right: 50,
                    child: AddButton(
                      onPressed: _showAdd,
                    ))
              ],
                          )
          ],
        )
    );
  }

  void _showAdd() {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
      title: Text("할 일 추가"),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(
          hintText: "할 일을 입력해주세요",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
        )
        ),
      ),
      actions: [
          TextButton
          (
          onPressed: () {
          Navigator.of(context).pop(); },
          child: Text('취소', style: TextStyle(color: Colors.black),),
         ),
        TextButton(onPressed: () {
          if(_textController.text.isNotEmpty){
            setState(() {
              toDoList.add(_textController.text);
              _textController.clear();
            });
            Navigator.of(context).pop();
          }
        }, child: Text("추가", style: TextStyle(color: Colors.black),))
        ],
      );
  });
}}
