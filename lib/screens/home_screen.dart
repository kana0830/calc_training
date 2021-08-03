import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Text("問題数を選択して「スタート」ボタンを押してください"),
                //TODO プルダウン選択肢
                Expanded(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          label: Text("スタート"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.brown,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
