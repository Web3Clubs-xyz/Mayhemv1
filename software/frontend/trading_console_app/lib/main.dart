import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(TradingConsoleApp());
}

class TradingConsoleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayhem Trading Console',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trading Console'),
        centerTitle: true,
      ),
      body: Center(
        // This will center the widget on the screen
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800, // Max width of the app
            maxHeight: 800, // Max height of the app
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                GridView.count(
                  crossAxisCount: 5, // Create 3 columns
                  shrinkWrap:
                      true, // Prevents the grid from taking up full height
                  physics:
                      NeverScrollableScrollPhysics(), // Disables scrolling in GridView
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildOptionCard(
                      context,
                      icon: Icons.security,
                      label: 'Secure',
                      screen: const SecureScreen(),
                    ),
                    _buildOptionCard(
                      context,
                      icon: Icons.monetization_on,
                      label: 'Stake',
                      screen: const StakeScreen(),
                    ),
                    _buildOptionCard(
                      context,
                      icon: Icons.trending_up,
                      label: 'Trading',
                      screen: const TradingScreen(),
                    ),
                    _buildOptionCard(
                      context,
                      icon: Icons.videogame_asset,
                      label: 'Gaming',
                      screen: const GamingScreen(),
                    ),
                    _buildOptionCard(
                      context,
                      icon: Icons.settings_input_antenna,
                      label: 'DePIN',
                      screen: const DePINScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required IconData icon, required String label, required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: 100, // Fixed width for consistent spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Container(
              height: 60, // Fixed height container for icon
              child: Center(
                // Center the icon within its container
                child: Icon(icon, size: 36, color: Colors.blue),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Center the text
            ),
          ],
        ),
      ),
    );
  }
}

class SecureScreen extends StatelessWidget {
  const SecureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Secure')),
      body:
          Center(child: Text('Secure Screen', style: TextStyle(fontSize: 24))),
    );
  }
}

class StakeScreen extends StatelessWidget {
  const StakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stake')),
      body: Center(child: Text('Stake Screen', style: TextStyle(fontSize: 24))),
    );
  }
}

class TradingScreen extends StatelessWidget {
  const TradingScreen({Key? key}) : super(key: key);

  Future<void> _runElectronMainJS(String url) async {
    Process.run('electron', [
      '/home/dreybuilds/Documents/personal_projects/mayhem/Mayhemv1/software/frontend/electron_app',
      url // Pass URL to Electron app
    ]).then((result) {
      print('Electron app triggered with URL: $url');
    }).catchError((e) {
      print('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trading')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trading Screen', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _runElectronMainJS('https://app.uniswap.org'),
              child: Text('Uniswap'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _runElectronMainJS('https://dexscreener.com'),
              child: Text('Dexscreener'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _runElectronMainJS('https://mexc.com'),
              child: Text('Mexc'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _runElectronMainJS('https://aave.com'),
              child: Text('Aave'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _runElectronMainJS('https://jup.ag'),
              child: Text('Jupiter'),
            ),
          ],
        ),
      ),
    );
  }
}

class GamingScreen extends StatelessWidget {
  const GamingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gaming')),
      body:
          Center(child: Text('Gaming Screen', style: TextStyle(fontSize: 24))),
    );
  }
}

class DePINScreen extends StatelessWidget {
  const DePINScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DePIN')),
      body: Center(child: Text('DePIN Screen', style: TextStyle(fontSize: 24))),
    );
  }
}
