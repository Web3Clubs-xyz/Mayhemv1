import 'package:flutter/material.dart';

void main() {
  runApp(TradingConsoleApp());
}

class TradingConsoleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Console',
      theme: ThemeData(primarySwatch: Colors.blue),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.blue), // Adjusted size
          SizedBox(height: 8),
          Text(label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold)), // Adjusted text size
        ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trading')),
      body:
          Center(child: Text('Trading Screen', style: TextStyle(fontSize: 24))),
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
