import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: 1024,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
        },
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
          Icon(icon, size: 50, color: Colors.blue),
          SizedBox(height: 8),
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLinkButton('Uniswap', 'https://app.uniswap.org'),
            _buildLinkButton('Aave', 'https://app.aave.com'),
            _buildLinkButton('Dexscreener', 'https://dexscreener.com'),
            _buildLinkButton('Bybit', 'https://www.bybit.com'),
            _buildLinkButton('Binance', 'https://www.binance.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton(String label, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Text(label),
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
