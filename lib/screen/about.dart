import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 66, 66),
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/kinfish.jfif'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Text(
              'NAME',
              style: TextStyle(
                  color: Colors.grey, letterSpacing: 2.0, fontFamily: 'Po'),
            ),
            SizedBox(height: 10.0),
            Text(
              'KINFEMICHAEL TARIKU',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Po'),
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT STAUS',
              style: TextStyle(
                  color: Colors.grey, letterSpacing: 2.0, fontFamily: 'Po'),
            ),
            SizedBox(height: 10.0),
            Text(
              'STUDENT AT AAU',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Po'),
            ),
            SizedBox(height: 60.0),
            Center(
              child: Container(
                child: Text(
                  'CONTACT INFO',
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Po'),
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 1,
            
              color: Colors.white,
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'kinfetare83@gmail.com',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Po'),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  '09191866517',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Po'),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: new Container(
          height: 40.0,
          margin: EdgeInsets.only(bottom: 30),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright,
                color: Colors.grey,
                size: 14,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Copyright - 2022',
                style: TextStyle(
                    color: Colors.grey, letterSpacing: 2.0, fontFamily: 'Po'),
              ),
            ],
          )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: Colors.grey[800],
      elevation: 1.0,
      title: Text('About Me'),
      centerTitle: true,
    );
  }
}
