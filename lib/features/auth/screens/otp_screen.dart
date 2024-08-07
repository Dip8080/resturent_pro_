import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key , required this.PhoneNumber});
  final String PhoneNumber;

  String getLastFourCharacters(String input) {
  if (input.length <= 4) {
    return input;
  } else {
    return input.substring(input.length - 4);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('OTP Varification')
          ]),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/two-factor-authentication-concept-illustration_114360-5488.jpg?t=st=1723012457~exp=1723016057~hmac=6e9a8d6123a579cfa9047584de802c1eaf65d76d1c6e49e4a33c94415435679b&w=740'),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Enter Verification Code',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 20),
              ),
              Text(
                  'We are automatically detecting a SMS send to your mobile number *******${getLastFourCharacters(PhoneNumber)}')
            ],
          ),
        ));
  }
}
