import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  var services = [
    "View &Verify Profile",
    "Search CPD Activities",
    "View CPD Activities",
    "View CPD Credits",
    "Leave     Requests",
    "Confirm CPD Activities",
    "Create TCP Apprisal",
    "View Apprisal Events",
    "Transfer Requests",
  ];

  var images = [
    "images/icons/profile.png",
    "images/icons/search.png",
    "images/icons/file.png",
    "images/icons/eye-exam.png",
    "images/icons/logout.png",
    "images/icons/verified.png",
    "images/icons/create.png",
    "images/icons/apprise.png",
    "images/icons/transfer.png",
  ];

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff34a0bc),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff34a0bc),
      centerTitle: true,
      title: const Text('HRCPD'),
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/moeys.png'),
        ),
      ],
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff34a0bc),
              ),
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            title: const Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 245, 233, 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'images/teacher.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'images/quote.png',
                        height: 200, // Increase this value to make it larger
                        width: 200, // Increase this value to make it larger
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'images/using-a-mobile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
                child: Container(
              child: Center(
                child: _buildGridMenu(context),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final int crossAxisCount = 3; // Number of columns
    final double itemHeight =
        MediaQuery.of(context).size.height / 7.1; // Height of each grid item
    final double itemWidth = MediaQuery.of(context).size.width /
        crossAxisCount; // Width of each grid item

    return GridView(
      physics: NeverScrollableScrollPhysics(), // Prevent scrolling
      shrinkWrap:
          true, // Makes the GridView only occupy the space needed by its children
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: itemWidth / itemHeight,
      ),
      children: List.generate(services.length, (index) {
        return InkWell(
          onTap: () {
            debugPrint(services[index]);
          },
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  images[index],
                  height: 40,
                  width: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(
                      10), // Reduced padding to fit content better
                  child: Text(
                    services[index],
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        height: 1.2,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
