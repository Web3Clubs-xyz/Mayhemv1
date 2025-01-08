import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
                        icon: Icons.trending_up,
                        label: 'Trading',
                        screen: const TradingScreen(),
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
            _buildLinkButton(context, 'Uniswap', 'https://app.uniswap.org'),
            _buildLinkButton(context, 'Aave', 'https://app.aave.com'),
            _buildLinkButton(context, 'Dexscreener', 'https://dexscreener.com'),
            _buildLinkButton(context, 'Bybit', 'https://www.bybit.com'),
            _buildLinkButton(context, 'Binance', 'https://www.binance.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton(BuildContext context, String label, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(url: url),
            ),
          );
        },
        child: Text(label),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Web View')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
        onProgressChanged: (controller, progress) {
          debugPrint('Loading: $progress%');
        },
      ),
    );
  }
}
