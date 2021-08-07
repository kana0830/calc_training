import 'package:calc_training/screens/test_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<int>> _menuItems = [];
  int _numberOfQuestions = 0;

  @override
  void initState() {
    super.initState();
    setMenuItems();
    _numberOfQuestions = _menuItems[0].value!;
  }

  void setMenuItems() {
    _menuItems
      ..add(DropdownMenuItem(
        child: Text("10"),
        value: 10,
      ))
      ..add(DropdownMenuItem(
        child: Text("20"),
        value: 20,
      ))
      ..add(DropdownMenuItem(
        child: Text("30"),
        value: 30,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/image_title.png"),
                const SizedBox(
                  height: 80.0,
                ),
                const Text("問題数を選択して「スタート」ボタンを押してください"),
                const SizedBox(
                  height: 100.0,
                ),
                DropdownButton(
                  items: _menuItems,
                  value: _numberOfQuestions,
                  onChanged: (int? selectedValue) {
                    setState(() {
                      _numberOfQuestions = selectedValue!;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.skip_next),
                      onPressed: () => startTestScreen(),
                      label: Text("スタート"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  startTestScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TestScreen(numberOfQuestions: _numberOfQuestions)));
  }
}
