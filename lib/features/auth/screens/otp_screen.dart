import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_restaurant/common/widgets/custom_button_widget.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.PhoneNumber});
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('OTP Varification'),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/branch_banner.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: .5,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'We are automatically detecting a SMS send to your mobile number *******${getLastFourCharacters(PhoneNumber)}',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.amber.shade400,
                contentPadding: EdgeInsets.all(5),
                enabledBorderColor: Colors.amber.shade900,
                keyboardType: TextInputType.number,
                onSubmit: (value) => print(value),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: CustomButtonWidget(
                  btnTxt: getTranslated('Submit', context),
                  onTap: () {
                    print('otp submit button clicked');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
