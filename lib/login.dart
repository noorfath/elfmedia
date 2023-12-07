import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icon/filla.svg',
                height: 100,
                width: 100,
              ),
              SizedBox(height: 12),
              AnimatedRoundedTextField(
                labelText: 'Username',
                textColor: Colors.white,

              ),
              SizedBox(height: 12),
              AnimatedRoundedTextField(
                obscureText: true,
                labelText: 'Password',
                textColor: Colors.white,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                },
                style: ElevatedButton.styleFrom(primary: Color(0xff323233)),
                child: Text(
                  'Login',
                  style: GoogleFonts.abhayaLibre(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedRoundedTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Color? textColor;

  const AnimatedRoundedTextField({

    required this.labelText,
    this.obscureText = false,
    this.textColor,
  });

  @override
  _AnimatedRoundedTextFieldState createState() => _AnimatedRoundedTextFieldState();
}

class _AnimatedRoundedTextFieldState extends State<AnimatedRoundedTextField> {
  dynamic _containerWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _containerWidth = 500.0; // Set the expanded width
        });
      },
      child: AnimatedContainer(
        width: _containerWidth,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: TextField(
              obscureText: widget.obscureText,
              style: TextStyle(color: widget.textColor),
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: InputBorder.none,
                labelStyle: TextStyle(color: widget.textColor,fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
