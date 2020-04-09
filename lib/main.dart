import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'platform/platformScaffold.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  // await localhostServer.start();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueGrey[900],
      title: 'Underc0de',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController webView;
  String url = "https://underc0de.org/foro/";
  String _urlCompare = 'https://underc0de.org/';
  String _urlCompare2 = 'https://blog.underc0de';
  String username="Invitado",urlimguser="";
  double progress = 0;
  bool _isLoading = false;
  MediaQueryData queryData;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    TextStyle style20 = new TextStyle(
      inherit: true,
      fontSize: 15.0,
      color: Colors.white,
    );

    return new Builder(
      builder: (context) => WillPopScope(
        onWillPop: () => _exitApp(context),
        child: new PlatformScaffold(
          backgroundColor: Colors.blueGrey[900],
          drawer: Drawer(
            elevation: 3,
            child: Container(
              child: Container(
                padding: new EdgeInsets.only(
                  left: 22.0,
                  top: 20.0,
                ),
                decoration:
                    new BoxDecoration(color: Color.fromRGBO(0, 14, 23, 1)),
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: new EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration:
                          new BoxDecoration(color: Color.fromRGBO(0, 7, 11, 1)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                                Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                                radius: 20,
                                backgroundImage: NetworkImage(urlimguser)),
                                Spacer(),
                            Text(
                              username,
                              style: style20,
                            ),
                                Spacer(),

                          ]),
                    ),
                    ListTile(
                      title: Text(
                        "BUSCAR",
                        style: style20,
                      ),
                      leading: new Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onTap: () {
                        webView.loadUrl(
                            url: 'https://underc0de.org/buscador.html');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "WEB",
                        style: style20,
                      ),
                      leading: new Icon(
                        Icons.web,
                        color: Colors.white,
                      ),
                      onTap: () {
                        webView.loadUrl(url: 'https://underc0de.org/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "FORO",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.comments,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(url: 'https://underc0de.org/foro');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "BLOG",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.blog,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(url: 'https://blog.underc0de.org/');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "POST NUEVOS",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.archive,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(
                            url:
                                'https://underc0de.org/foro/index.php?action=unread');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "MENSAJES PRIVADOS",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.envelope,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(
                            url:
                                'https://underc0de.org/foro/index.php?action=pm');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "POST FAVORITOS",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.star,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(
                            url:
                                'https://underc0de.org/foro/index.php?action=bookmarks');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        "CONTACTO",
                        style: style20,
                      ),
                      leading: new FaIcon(FontAwesomeIcons.solidEdit,
                          color: Colors.white),
                      onTap: () {
                        webView.loadUrl(url: 'https://underc0de.org/#contacto');
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: new EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration:
                          new BoxDecoration(color: Color.fromRGBO(0, 7, 11, 1)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.white),
                                onPressed: () {
                                  _launchURL('https://facebook.com/underc0de');
                                  Navigator.pop(context);
                                }),
                            Spacer(),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.twitter,
                                    color: Colors.white),
                                onPressed: () {
                                  _launchURL('https://twitter.com/underc0de');
                                  Navigator.pop(context);
                                }),
                            Spacer(),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.instagram,
                                    color: Colors.white),
                                onPressed: () {
                                  _launchURL('https://instagram.com/underc0de');
                                  Navigator.pop(context);
                                }),
                            Spacer(),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(children: <Widget>[
            InAppWebView(
              initialUrl: url,
              //initialFile: "assets/index.html",
              initialHeaders: {},
              initialOptions: InAppWebViewWidgetOptions(),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onLoadStart: (InAppWebViewController controller, String url) {
                try {
                  
                // print("onLoadStart $url");
                String _url = url.substring(0, 22);
                // print('URL SUB STRING ======>>> $_url');
                setState(() {
                  if (_urlCompare.compareTo(_url) != 1) {
                    this.url = url;
                    print('COMPARE URL TRUE');
                  } else if (_urlCompare2.compareTo(_url) != 1) {
                    this.url = url;
                    print('COMPARE URL TRUE');
                  } else {
                    // this.url = url;
                    print('COMPARE URL FALSE');
                    _launchURL(url);
                  }
                });
                } catch (e) {
                }
              },
              onLoadStop:
                  (InAppWebViewController controller, String url) async {
                // print("onLoadStop $url");
                try {
                String resultImg = await controller.evaluateJavascript(source: "\$('.avatar.rounded-circle').attr('src');");
                String result3 = await controller.evaluateJavascript(source: "\$('.username').html();");
                  
                setState(() {
                  this.url = url;
                  if(result3!=null){
                    username=result3;
                    urlimguser=resultImg;
                  }
                });
                } catch (e) {
                }

              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                    try {
                      
                setState(() {
                  this.progress = progress / 100;
                  // print('PROGGRESSSS ======>>>> $progress');
                  if (progress < 100) {
                    setState(() {
                      _isLoading = true;
                    });
                  } else {
                    _isLoading = false;
                  }
                });
                    } catch (e) {
                    }
              },
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: _isLoading
                    ? LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(0, 14, 23, 1),
                      )
                    : Container()),
          ]),
        ),
      ),
    );
  }

  Future<bool> _exitApp(BuildContext context) async {
    try {
      
    if (webView != null) {
      webView.goBack();
    } else {
      print('NO FUNCIONO');
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No back history item")),
      );
      return Future.value(false);
    }
    } catch (e) {
    }
  }

  _launchURL(url) async {
    try {
      
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // throw 'Could not launch $url';
    }
    } catch (e) {
    }
  }
}
