import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/screens/scan_map_code.dart';
import 'package:devfest_mobile_app/components/talk_card.dart';
import 'package:devfest_mobile_app/components/topic.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget decideView() {
    if (_currentIndex == 0) {
      return ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Keynote',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: Text(
                      '9:00 / EN / Hall A',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          TalkCard(
            talkName: "Why metal is so great?",
            firstSubtitle: "Beginners / EN / 40 min",
            secondSubtitle: "9:30 / EN / Hall A",
            topics: List<Topic>.from([
              Topics.android,
              Topics.firebase,
            ]),
            speakerPhoto: Image(
              image: AssetImage("assets/ozzy.jpg"),
              height: 40.0,
            ),
            speakerName: "Ozzy Osbourne",
            company: "Black Sabbath"
          ),
          TalkCard(
            talkName: "Widgets!",
            secondSubtitle: "9:30 / EN / Hall B",
            topics: List<Topic>.from([
              Topics.android,
              Topics.flutter,
            ]),
            speakerPhoto: Image(
              image: AssetImage("assets/ozzy.jpg"),
              height: 40.0,
            ),
            speakerName: "Ozzy Osbourne",
            company: "Black Sabbath"
          ),
          TalkCard(
            talkName: "Widgets with Firebase!",
            firstSubtitle: "Beginners / EN / 40 min",
            topics: List<Topic>.from([
              Topics.flutter,
              Topics.firebase,
            ]),
            speakerPhoto: Image(
              image: AssetImage("assets/ozzy.jpg"),
              height: 40.0,
            ),
            speakerName: "Ozzy Osbourne",
            company: "Black Sabbath"
          ),
          TalkCard(
            talkName: "No topics!",
            firstSubtitle: "Beginners / EN / 40 min",
            secondSubtitle: "10:30 / EN / Hall A",
            speakerPhoto: Image(
              image: AssetImage("assets/ozzy.jpg"),
              height: 40.0,
            ),
            speakerName: "Ozzy Osbourne",
            company: "Black Sabbath"
          )
        ],
      );
    } else if (_currentIndex == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is inventory screen."),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is leaderboard screen."),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevFest CZ 2019'),
      ),
      body: Center(
        child: Container(
          child: decideView(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Config.colorPalette.shade700,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScanMapCodeScreen(),
              ),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        // new
        currentIndex: _currentIndex,
        // new
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.amberAccent,
            icon: Icon(
              Icons.schedule,
            ),
            title: Text(
              'Schedule',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            title: Text(
              'Map',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center,
            ),
            title: Text(
              'Inventory',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              'Leaderboard',
            ),
          ),
        ],
      ),
    );
  }
}
