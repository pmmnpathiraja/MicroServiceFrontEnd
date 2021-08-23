import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/add_vehicle.dart';
import 'package:front/list.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: '👈 Vehicle List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  Future<void> pageChangeFunction(var vehicleType) async {
    final vehicleTypeResponse = await get(Uri.parse(
        'http://localhost:9090/api/category-service/vehicle/category?category=$vehicleType'));
    var vehicleTypeResponseJson = convert.jsonDecode(vehicleTypeResponse.body);
    var vehicleTypeResponseMap = vehicleTypeResponseJson.asMap();
    print(vehicleTypeResponseJson);
    //print(vehicleTypeResponseMap);
    // vehicleTypeResponseMap.values.forEach((value) {
    //   print(value);
    // });
    // vehicleTypeResponseMap.keys.forEach((value) {
    //   print(value);
    // });
    //Map vehicleTypeResponseMapData = Map();
    //print(vehicleTypeResponseMap.runtimeType);
    //vehicleTypeResponseMap.forEach((key, value) {
    //print(key);
    //print(value.runtimeType);
    //print(value['licensePlateNumber']);
    //print(value['licensePlateNumber'].runtimeType);

    //vehicleTypeResponseMapData[key] = value;
    //});
    //print(vehicleTypeResponseMap[0]);
    //print(vehicleTypeResponseMapData);
    //(vehicleTypeResponseMapData.runtimeType);
    final vehicleReviewResponse = await get(
        Uri.parse('http://localhost:9090/api/review-service/rv/getAll'));
    var vehicleReviewResponseJson =
        convert.jsonDecode(vehicleReviewResponse.body);
    var vehicleReviewResponseMap = vehicleReviewResponseJson.asMap();
    //print(vehicleReviewResponseMap);
    final vehicleAvailability = await get(Uri.parse(
        'http://localhost:9090/api/availability-service/availability/getAll'));
    var vehicleAvailabilityJson = convert.jsonDecode(vehicleAvailability.body);
    Map vehicleAvailabilityMap = vehicleAvailabilityJson.asMap();

    print(vehicleAvailabilityMap);
    //

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PageListChange(vehicleTypeResponseMap,vehicleReviewResponseMap,vehicleAvailabilityMap);
    }));

    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (BuildContext context) {
    //   return RegisterPage();
    // }));

  }

  _makeGetRequest() async {
    //  final vehicleResponse = await get(
    //      Uri.parse('http://localhost:9090/api/review-service/rv/getAll'));
    //  var jsonResponse = convert.jsonDecode(vehicleResponse.body);
    //  print(jsonResponse.runtimeType);
    //  Map myData = jsonResponse.asMap();
    //  print(jsonResponse);
    //  myData.values.forEach((value) {
    //    print(value);
    //  });
    //  myData.keys.forEach((value) {
    //    print(value);
    //  });
    // // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    //  print(myData[0]['reviewList']);
    //  print(myData[0]['reviewList'].runtimeType);
    //  var dddd = myData[0]['reviewList'].asMap();
    //  print(dddd.runtimeType);
    // // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    //  myData.forEach((key, value) {
    //    print(key);
    //    print(value['reviewList']);
    //    print(value['id']);
    //    print(value['reviewList'].runtimeType);
    //    Map mmyData = value['reviewList'].asMap();
    //    mmyData.forEach((key1, value1) {
    //      print(value1);
    //    });
    //  });

    //print(vehicleResponse.body);
    // sample info available in response
    // final statusCode = response.statusCode;
    // final headers = response.headers;
    // final contentType = headers['content-type'];
    // final json = response.body;

    //
    // final vehicleAvailability = await get(
    //     Uri.parse('http://localhost:9090/api/availability-service/availability/getAll'));
    // var vehicleAvailabilityJson = convert.jsonDecode(vehicleAvailability.body);
    // Map vehicleAvailabilityMap = vehicleAvailabilityJson.asMap();

    // TODO convert json to object...

    //var url = Uri.parse('http://localhost:9090/api/category-service/vehicle/create');
    //var response = await post(url, body: {'name': 'doodle', 'color': 'blue'});
    // var response = await post(url, body: {
    //   "licensePlateNumber": "AB-9999",
    //   "category":"car",
    //   "numberOfSeats":"5"});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    final vehicleTypeResponse = await get(Uri.parse(
        'http://localhost:9090/api/category-service/vehicle/category?category=car'));
    var vehicleTypeResponseJson = convert.jsonDecode(vehicleTypeResponse.body);
    var vehicleTypeResponseMap = vehicleTypeResponseJson.asMap();
    print(vehicleTypeResponseMap);
    final vehicleReviewResponse = await get(
        Uri.parse('http://localhost:9090/api/review-service/rv/getAll'));
    var vehicleReviewResponseJson =
        convert.jsonDecode(vehicleReviewResponse.body);
    var vehicleReviewResponseMap = vehicleReviewResponseJson.asMap();
    print(vehicleReviewResponseMap);
    final vehicleAvailability = await get(Uri.parse(
        'http://localhost:9090/api/availability-service/availability/getAll'));
    var vehicleAvailabilityJson = convert.jsonDecode(vehicleAvailability.body);
    Map vehicleAvailabilityMap = vehicleAvailabilityJson.asMap();
    print(vehicleAvailabilityMap);

    // var url = Uri.parse('http://localhost:9090/api/availability-service/availability/setAvailability');
    // Map data = {
    //     "availability": "In Stock",
    //     "quantity": "10",
    // };
    // //encode Map to JSON
    // var body = json.encode(data);
    //
    // var response = await post(url,
    //     headers: {"Content-Type": "application/json"},
    //     body: body
    // );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    //
    // final vehicleAvailability1 = await get(
    //     Uri.parse('http://localhost:9090/api/availability-service/availability/getAll'));
    // var vehicleAvailabilityJson1 = convert.jsonDecode(vehicleAvailability1.body);
    // Map vehicleAvailabilityMap1 = vehicleAvailabilityJson1.asMap();
    // print(vehicleAvailabilityMap1);

    // var url = Uri.parse('http://localhost:9090/api/category-service/vehicle/create');
    // Map data = {
    //   "licensePlateNumber": "AB-9999",
    //   "category":"car",
    //   "numberOfSeats":"5"
    // };
    // //encode Map to JSON
    // var body = json.encode(data);
    //
    // var response = await post(url,
    //     headers: {"Content-Type": "application/json"},
    //     body: body
    // );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    //
    // final vehicleTypeResponse1 = await get(Uri.parse(
    //     'http://localhost:9090/api/category-service/vehicle/category?category=car'));
    // var vehicleTypeResponseJson1 = convert.jsonDecode(vehicleTypeResponse1.body);
    // var vehicleTypeResponseMap1 = vehicleTypeResponseJson1.asMap();
    // print(vehicleTypeResponseMap1);
//************************************************************************************************************************
    print("ddddddddddddddddddddddddddddddd");
    vehicleReviewResponseMap[1]["reviewList"].add("bbbbbbb");
    print(vehicleReviewResponseMap[1]["reviewList"]);
    var url = Uri.parse(
        'http://localhost:9090/api/review-service/rv/by/6');
    Map data = {
      "id" : "6",
      "reviewList": ["Good"]
    };
    //encode Map to JSON
    print(data.runtimeType);


    var body = json.encode(vehicleReviewResponseMap[1]);

    var response = await put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final vehicleAvailability1 = await get(
        Uri.parse('http://localhost:9090/api/review-service/rv/getAll'));
    var vehicleAvailabilityJson1 =
        convert.jsonDecode(vehicleAvailability1.body);
    Map vehicleAvailabilityMap1 = vehicleAvailabilityJson1.asMap();
    print(vehicleAvailabilityMap1);

  }

  void _incrementCounter() {
     //_makeGetRequest();
   pageChangeFunction('car');
    //
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.deepOrangeAccent,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          )
      ),
      body: Row(children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.lightBlue
                  ],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white,
                      Colors.lightBlue
                    ],
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                     Text(
                      'Greetings, planet!',
                      style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black12,
                      ),
                    ),
                    // Solid text as fill.
                      Text(
                      'Greetings, planet!',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                    SizedBox(height: 20,),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black12,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black12,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black12,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Greetings, planet!',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),


              ])),
        )
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () =>

            Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return RegisterPage();
        })),
        // _incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        elevation: 4,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: new Color(0xFF0062ac),
              ),
              accountName: Text("authNotifier.user.displayName"),
              accountEmail: Text("authNotifier.user.email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? new Color(0xFF0062ac)
                        : Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Car',
                textScaleFactor: 1.5,
              ),
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return MapLoadBluetooth(userPersonalData);
                // }));
                pageChangeFunction('car');
              },
            ),
            ListTile(
              title: Text(
                'Truck',
                textScaleFactor: 1.5,
              ),
              onTap: () {
                // setupSignOut(_firebaseUser);
                pageChangeFunction('truck');
              },
            ),
            ListTile(
              title: Text(
                'Van',
                textScaleFactor: 1.5,
              ),
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return MapLoadBluetooth(userPersonalData);
                // }));
                pageChangeFunction('van');
              },
            ),
            ListTile(
              title: Text(
                'Lorry',
                textScaleFactor: 1.5,
              ),
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return MapLoadBluetooth(userPersonalData);
                // }));
                pageChangeFunction('lorry');
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// zuul.routes.availability-service.path=/availability-service/**
// zuul.routes.availability-service.service-id=AVAILABILITY-SERVICE
//
// zuul.routes.review-service.path=/review-service/**
// zuul.routes.review-service.service-id=REVIEW-SERVICE
//
// zuul.routes.category-service.path=/category-service/**
// zuul.routes.category-service.service-id=CATEGORY-SERVICE

// final vehicleTypeResponse = await get(Uri.parse(
// 'http://localhost:9090/api/category-service/vehicle/category?category=car'));
// print(vehicleTypeResponse.body);
// var vehicleTypeResponseJson = convert.jsonDecode(vehicleTypeResponse.body);
// print(vehicleTypeResponseJson.runtimeType);
// Map vehicleTypeResponseMap = vehicleTypeResponseJson.asMap();
// print(vehicleTypeResponseJson);
// vehicleTypeResponseMap.values.forEach((value) {
// print(value);
// });
// vehicleTypeResponseMap.keys.forEach((value) {
// print(value);
// });
// vehicleTypeResponseMap.forEach((key, value) {
// print(key);
// print(value['licensePlateNumber']);
// print(value['licensePlateNumber'].runtimeType);
// // Map mmyData = value['licensePlateNumber'].asMap();
// // mmyData.forEach((key1, value1) {
// //   print(value1);
// // });
// });
// final vehicleReviewResponse = await get(Uri.parse('http://localhost:9090/api/review-service/rv/getAll'));
// // print(vehicleReviewResponse.body);
// // Navigator.of(context)
// //     .push(MaterialPageRoute(builder: (BuildContext context) {
// //   return PageChange(vehicleTypeResponse,vehicleReviewResponse);
// // }));
