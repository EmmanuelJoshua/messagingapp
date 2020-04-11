import 'dart:math';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/api/randomuserapi.dart';
import 'package:messengerapp/ui/messengerdm.dart';

class MessengerHome extends StatefulWidget {
  @override
  _MessengerHomeState createState() => _MessengerHomeState();
}

class _MessengerHomeState extends State<MessengerHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D2427),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.sort),
          color: Colors.white,
        ),
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white70,
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
                child: Text('Messages',
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'))),
            Tab(
                child: Text('Online',
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'))),
            Tab(
                child: Text('Groups',
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'))),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Color(0xFF1D2427),
      body: TabBarView(
        controller: _tabController,
        children: [
          new Messages(),
          Center(child: Icon(Icons.directions_transit)),
          Center(child: Icon(Icons.directions_bike)),
        ],
      ),
//      bottomNavigationBar: FlashyTabBar(
//        animationCurve: Curves.linear,
//        showElevation: true,
//        selectedIndex: _selectedIndex,
//          onItemSelected: (index) => setState((){
//           _selectedIndex = index;
//          }),
//          items: [
//            FlashyTabBarItem(
//                icon: new Icon(Icons.person), title: new Text("User")),
//            FlashyTabBarItem(
//                icon: new Icon(Icons.settings), title: new Text("Settings")),
//            FlashyTabBarItem(
//                icon: new Icon(Icons.info), title: new Text("About"))
//          ]),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({
    Key key,
  }) : super(key: key);

  void _next(BuildContext context) {
    var router =
        MaterialPageRoute(builder: (BuildContext context) => MessengerDm());

    Navigator.of(context).push(router);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('Favorite Contacts',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              _next(context);
                            },
                            child: Card(
                                elevation: 0,
                                borderOnForeground: false,
                                child: Column(
                                  children: <Widget>[
                                    ClipOval(
                                      clipper: CircleClipper(),
                                      child: Image.asset(
                                        'assets/images/user.jpg',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text('Christina',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54)),
                                  ],
                                )),
                          );
                        },
                      )),
                ),
                Divider(),
                Expanded(child: updateUser()),
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'fab1',
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  FutureBuilder updateUser() {
    return FutureBuilder<Map>(
        future: UserAPI().getUserData(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            List features = content['results'];
            return ListView.builder(
                itemCount: features.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    onTap: () {
                      _next(context);
                    },
                    leading: ClipOval(
                        clipper: CircleClipper(),
                        child: Image.network(
                          '${content['results'][position]['picture']['large']}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    title: Text('${content['results'][position]['name']['first']}'+' '+ '${content['results'][position]['name']['last']}',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.black54)),
                    subtitle: Text('${content['results'][position]['email']}',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Colors.blueGrey)),
                    trailing: Text('${content['results'][position]['location']['timezone']['offset']}',
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.black54)),
                  );
                });
          } else {
            return Center(
              child: Column(

                children: <Widget>[
                  Text('No Data',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.black54)),
                  Text('Check your internet ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.black54)),
                ],
              )
            );
          }
        });
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
