import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
            duration: new Duration(microseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/pexels.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0
                        ),
                      ),
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: 'Enter email',

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: 'Enter pasword',
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 80.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text('Login'),
                          onPressed: ()=> {},
                          splashColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}