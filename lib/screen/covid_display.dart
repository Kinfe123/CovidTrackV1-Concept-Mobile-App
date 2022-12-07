import 'package:flutter/material.dart';

class CovidDisplay extends StatefulWidget {
  CovidState createState() => CovidState();

  const CovidDisplay({super.key});
}
class CovidState extends State<CovidDisplay> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Info'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Text('This is a covid display page'),
    );
  }

}
