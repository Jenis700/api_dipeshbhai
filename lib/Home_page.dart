import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();

  TextEditingController value1Controller = TextEditingController();
  TextEditingController value2Controller = TextEditingController();
  TextEditingController value3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              TextFormField(
                controller: textController,
                validator: (value) {},
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "text 1",
                  hintText: "Enter your text 1",
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: "assets/icons/Mail.svg",
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 56,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () async {
                    print(
                        "text ::::::::::::::::::::::::::::::::::::: ${textController.text}");

                    Map data = {
                      "mobile": textController.text,
                    };
                    String body = json.encode(data);
                    String url = "http://134.209.149.86:4101/test/otp/send";
                    http.Response response = await http.post(
                      Uri.parse(url),
                      headers: {"Content-Type": "application/json"},
                      body: body,
                    );
                    var responseData = json.decode(response.body);
                    print('Daataa.,...... : ${responseData}');
                  },
                  child: Text(
                    "text",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(" email :: ${textController.text}"),
              SizedBox(height: 20),

              SizedBox(height: 70),

// .....................................................................................................................
              TextFormField(
                controller: value1Controller,
                validator: (value) {},
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "value 1",
                  hintText: "Enter your value 1",
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: "assets/icons/Mail.svg",
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: value2Controller,

                validator: (value) {},

                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "value 2",
                  hintText: "Enter your value 2",
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: "assets/icons/Mail.svg",
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: 200,
                height: 56,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () async {
                    print(
                        "text :::::::::::::::::::::::::::::: ${value1Controller.text}");
                    print(
                        "text :::::::::::::::::::::::::::::: ${value2Controller.text}");
                    Map data = {
                      "mobile": value1Controller.text,
                      "otpNumber" : value2Controller.text,
                    };
                    String body = json.encode(data);
                    String url = "http://134.209.149.86:4101/test/otp/verify";
                    http.Response response = await http.put(
                      Uri.parse(url),
                      headers: {"Content-Type": "application/json"},
                      body: body,
                    );
                    var responseData = json.decode(response.body);
                    print('Daataa.,...... : ${responseData}');
                  },
                  child: Text(
                    "text",
                    style: TextStyle(
                      fontSize: 18,
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

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
    );
  }
}
