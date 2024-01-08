import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: MyCardApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyCardApp extends StatefulWidget {
  @override
  _MyCardApp createState() => _MyCardApp();
}

class _MyCardApp extends State<MyCardApp> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/persona.jpg'),
            ),
            Text(
              "Christiam Alberth Mendoza Ruiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 180,
              child: Divider(
                thickness: 1.5,
                color: Colors.white38,
              ),
            ),
            Card(
              child: ListTile(
                leading: TextButton(
                  onPressed: () async {
                    final _numero = Uri(scheme: 'tel', path: '+51969619233');
                    if (await canLaunchUrl(_numero)) {
                      launchUrl(_numero);
                    }
                  },
                  child: Icon(Icons.phone),
                ),
                title: Text(
                  "+51 969619233",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Mobile Phone",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.check_circle_outline_outlined),
              ),
            ),
            Card(
              child: ListTile(
                leading: TextButton(
                  onPressed: () async {
                    final _mail = Uri(
                        scheme: 'mailto',
                        path: 'christiam.alberth.ruiz@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Consultas Reto My Card APP',
                          'body':
                              'Por este medio quisiera contactarte para algunas consultas.'
                        }));
                    if (await canLaunchUrl(_mail)) {
                      launchUrl(_mail);
                    }
                  },
                  child: Icon(Icons.mail_outlined),
                ),
                title: Text(
                  "christiam.alberth.ruiz@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Workmail",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.check_circle_outline_outlined),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.indigo),
                  onPressed: () => setState(() {
                    launchUrl(
                      Uri.parse("https://facebook.com"),
                      mode: LaunchMode.inAppWebView,
                    );
                  }),
                  child: Image.asset(
                    'assets/images/facebook.png',
                    height: 60,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.indigo),
                  onPressed: () => setState(() {
                    launchUrl(
                      Uri.parse("https://twitter.com"),
                      mode: LaunchMode.inAppWebView,
                    );
                  }),
                  child: Image.asset(
                    'assets/images/twitter.png',
                    height: 60,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.indigo),
                  onPressed: () => setState(() {
                    launchUrl(
                      Uri.parse("https://instagram.com"),
                      mode: LaunchMode.inAppWebView,
                    );
                  }),
                  child: Image.asset(
                    'assets/images/instagram.png',
                    height: 60,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
