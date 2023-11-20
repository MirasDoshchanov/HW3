import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NüMos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username/Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
          
                Navigator.pushReplacementNamed(context, '/mainPage');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _isDrawerOpen = !_isDrawerOpen;
            });
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('User Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/userProfile');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: _isDrawerOpen
          ? ListView(
              children: [
                ListTile(
                  title: Text('User Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, '/userProfile');
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            )
          : ListView.builder(
              itemCount: 1, 
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Once upon a time in... hollywood'),
                  subtitle: Text('A faded television actor and his stunt...'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(
                        "https://m.media-amazon.com/images/I/914HwUZ810L._UF1000,1000_QL80_.jpg"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutMovie', arguments: {
                      'title': 'Once upon a time in... hollywood',
                      'description':
                          'A faded television actor and his stunt...',
                    });
                  },
                );
              },
            ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'john.doe@example.com', 
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.edit),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.lock),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Movie'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Once upon a time in... hollywood', 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'A faded television actor and his stunt double strive to achieve fame and success in the final years of Hollywood\'s Golden Age in 1969 Los Angeles.', // Replace with actual movie description
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Spacer(), 
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/timetable');
              },
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Movie Title 1'), 
            subtitle: Text('Time: 10:00 AM'),
            onTap: () {
              Navigator.pushNamed(context, '/booking', arguments: {
                'movieTitle':
                    'Movie Title 1', 
                'sessionTime': '10:00 AM',
              });
            },
          ),
          ListTile(
            title: Text('Movie Title 2'), 
            subtitle: Text('Time: 1:00 PM'), 
            onTap: () {
              Navigator.pushNamed(context, '/booking', arguments: {
                'movieTitle':
                    'Movie Title 2', 
                'sessionTime': '1:00 PM', 
              });
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Ticket Reservation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/mainPage': (context) => MainPage(),
        '/aboutMovie': (context) => AboutMovieScreen(),
        '/userProfile': (context) => UserProfileScreen(),
        '/timetable': (context) => TimetableScreen(),
      },
    );
  }
}
