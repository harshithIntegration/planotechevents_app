import 'package:flutter/material.dart';
import 'package:planotechevents/Customer/view_cust_register.dart';
import 'package:planotechevents/profile.dart';
import 'package:planotechevents/registration/cust_register.dart';
import 'package:video_player/video_player.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late VideoPlayerController _controller;
  // ignore: unused_field
  late Future<void> _initializeVideoPlayerFuture;
  bool _isMuted = true; // Set initial muted state to true

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/planotech_cust_video.m4v')
      ..initialize().then((_) {
        _controller.play(); // Start playing the video immediately
        _controller.setLooping(true); // Set video to loop continuously
        _controller.setVolume(_isMuted ? 0.0 : 1.0); // Mute video initially
        setState(() {});
      });
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/plano_logo.png',
              height: 80,
              width: 320,
              fit: BoxFit.contain,
            ),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/mobilebackground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          OrientationBuilder(
            builder: (context, orientation) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: GestureDetector(
                        onTap: _toggleMute,
                        child: Stack(
                          children: [
                            VideoPlayer(_controller),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: _toggleMute,
                                icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                                color: Colors.white,
                                iconSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const  SizedBox(height: 65),
                 const   Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Exclusive For Corporates: book Event Essentials Online Now!  From Stage, Sound, Light, LED walls and Beyond',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:  Color.fromARGB(255, 119, 81, 81),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Event Registration  ->'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () { 
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ViewCustRegister(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('View Registration Details  ->'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0, 
        onTap: (int index) {
          switch (index) {
            case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
              break;
            case 2:
              
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
 