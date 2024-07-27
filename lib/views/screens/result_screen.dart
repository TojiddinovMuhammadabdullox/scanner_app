import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(result);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $result';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result: $result',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            if (Uri.tryParse(result)?.hasAbsolutePath ?? false)
              ElevatedButton(
                onPressed: _launchURL,
                child: const Text('Open Link'),
              ),
          ],
        ),
      ),
    );
  }
}
