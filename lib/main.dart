import 'package:flutter/material.dart';
import 'stream.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alkadafi Firnawan',
      theme: ThemeData(
        
      ),
      home: const StreamHomePage(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
Color bgColor = Colors.blueGrey;
late ColorStream colorStream;

@override
void initState() {
  super.initState();
  colorStream = ColorStream();
  changeColor();

}

void changeColor() async {
  // await for (var eventColor in colorStream.getColors()){
  //   setState((){
  //     bgColor = eventColor;
  //   });
  // }
  colorStream.getColors().listen((eventColor) {
    setState(() {
      bgColor = eventColor;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Stream'),
      backgroundColor: Colors.lightBlue,
    ),
    body: Container(
      decoration: BoxDecoration(color: bgColor),
    )
    );
  }
}