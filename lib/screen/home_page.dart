import 'dart:convert';
import 'dart:io' as dio;
import 'package:covidtracker/model/covid.dart';
import 'package:covidtracker/screen/about.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String country = '';
  String flagurl = '';
  int cases = 0;
  int recovered = 0;
  int deaths = 0;
  int population = 0;
  bool clicked = false;
  String continent = '';
  String url = 'https://disease.sh';
  String countryForDisplay = "";
  String errorMessage = 'Country or Case does not exist';
  bool isExist = true;
  final value = new NumberFormat("#,##0", "en_US");
  
  late Covid coviddata = Covid(
      country: '', flag: '', cases: 0, deaths: 0, recovered: 0, population: 0);
  void getData() async {
    try{
      var response =
        await get(Uri.parse('${url}/V3/covid-19/countries/${country}'));
    var data = await response.body;
    if(response.statusCode != 200){
      setState(() {
        isExist = false;
      });
      isExist = false;
      print('The country or the case is not found ${isExist}' );
      
      
    }else {
      
      var dataDecode = jsonDecode(data);
    // Navigator.pushNamed(context, '/covid', arguments: {
    //   'country': dataDecode['country'],
    //   'flag': dataDecode['countryInfo']['flag'],
    //   'cases': dataDecode['cases'],
    //   'deaths': dataDecode['deaths']
    // });
    print(dataDecode);

    setState(() {
      isExist = true;
      countryForDisplay = dataDecode['country'];
      flagurl = dataDecode['countryInfo']['flag'];
      cases = dataDecode['cases'];
      recovered = dataDecode['recovered'];
      population = dataDecode['population'];
      deaths = dataDecode['deaths'];
      continent = dataDecode['continent'];
    });


    }


    }catch(err) {
      print('Error has occured');
    }
    
    
    // var coviddata = Covid(country: dataDecode['country'], flag: dataDecode['countryInfo'], cases: dataDecode['cases'], deaths: dataDecode['deaths'], recovered: dataDecode['recovered'], population: dataDecode['population']);
    // print(coviddata.cases);

    // print(dataDecode);
  }

  final _textController = TextEditingController();
  Future refreshing() async  {
    var response =
        await get(Uri.parse('${url}/V3/covid-19/countries/${country}'));
    var data = await response.body;
    if(response.statusCode != 200){
      setState(() {
        isExist = false;
      });
      isExist = false;
      print('The country or the case is not found ${isExist}' );
      
      
    }else {
      
      var dataDecode = jsonDecode(data);
    // Navigator.pushNamed(context, '/covid', arguments: {
    //   'country': dataDecode['country'],
    //   'flag': dataDecode['countryInfo']['flag'],
    //   'cases': dataDecode['cases'],
    //   'deaths': dataDecode['deaths']
    // });
    print(dataDecode);

    setState(() {
      isExist = true;
      countryForDisplay = dataDecode['country'];
      flagurl = dataDecode['countryInfo']['flag'];
      cases = dataDecode['cases'];
      recovered = dataDecode['recovered'];
      population = dataDecode['population'];
      deaths = dataDecode['deaths'];
      continent = dataDecode['continent'];

      country = '';
    });


    }


  }
  @override
  Widget build(BuildContext context) {
    print(isExist);
    print(countryForDisplay);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 68, 66, 66),
      appBar: buildAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 0, bottom: 20),
                  child: Image(
                    image: AssetImage('assets/coronavirus.png'),
                  ),
                )),
            ListTile(
              onTap: () {
                      Navigator.pop(context);
                    },
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Po', fontSize: 25),
              ),
            ),
            Divider(
              height: 3,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => About())));
              },
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'About',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Po', fontSize: 25),
              ),
            ),
            Divider(
              height: 3,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshing,
        color: Colors.amber,
        backgroundColor: Colors.grey[800],
        edgeOffset: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Text(
                  'COVID TRACKER APP',
                  style: TextStyle(
                    fontFamily: 'Po',
                    color: Colors.white,
                    fontSize: 34,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                height: 2.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      margin: EdgeInsets.only(top: 20, right: 13, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 161, 158, 158),
                              spreadRadius: 1,
                              blurRadius: 15)
                        ],
                      ),
                      child: TextField(
                        textAlign: TextAlign.left,
                        cursorColor: Colors.amber,
                        controller: _textController,
                        decoration: InputDecoration(
                          // label: Text('Enter a number'),
                          border: InputBorder.none,
                          hintText: 'Enter a country',
      
                          hintStyle: TextStyle(
                              height: 1,
                              fontSize: 17,
                              fontFamily: 'Po',
                              color: Color.fromARGB(255, 129, 128, 128)),
                          // hintStyle: TextStyle(
                          //   color: Colors.deepPurple,
                          //   fontSize: 20.0,
                          //   letterSpacing: 0.8,
                          // ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                              countryForDisplay = "";
                              country = "";
                            },
                            icon: Icon(Icons.clear),
                            color: Colors.amber,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.amber,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontFamily: 'Po',
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, right: 20),
                        width: 60,
                        height: 60,
                        child: ElevatedButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 44, 42, 42),
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              country = _textController.text;
                              clicked = true;
                               getData();
                            });
                           
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
      
              // FutureBuilder(builder: getData() , )
      
               countryForDisplay.length > 0
                  ? (isExist ? (Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(flagurl),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              height: 60.0,
                            ),
                            Text(
                              'COUNTRY',
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "${countryForDisplay.toUpperCase()}" +
                                  "  - ${continent.toUpperCase()}",
                              style: TextStyle(
                                  color: Colors.amberAccent[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'CASES',
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "${value.format(cases)}",
                              style: TextStyle(
                                  color: Colors.amberAccent[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'DEATHS',
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "${value.format(deaths)}",
                              style: TextStyle(
                                  color: Colors.amberAccent[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'RECOVERED',
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${value.format(recovered)}",
                              style: TextStyle(
                                  color: Colors.amberAccent[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Po'),
                            ),
                            SizedBox(height: 30.0),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "POPULATION     - ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: 2.0,
                                        fontFamily: 'Po'),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: Text(
                                    "${value.format(population)}",
                                    style: TextStyle(
                                        color: Colors.amberAccent[200],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.0,
                                        letterSpacing: 2.0,
                                        fontFamily: 'Po'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )): (Container(
                      child: Text('Coutry does not exist '),
                    )))
                  : Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SpinKitThreeBounce(
                        color: Colors.amber,
                        size: 50.0,
                      ),
                      // child: Center(
                      //     child: CircularProgressIndicator(
                      //   color: Colors.amber,
                      // )),
                    )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.grey[800],
        elevation: 1.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Icon(Icons.menu, size: 30, color: Colors.white),
            Container(
              width: 40,
              height: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => About())));
                    },
                    icon: Icon(Icons.person),
                  )),
            )
          ],
        ));
  }
}
