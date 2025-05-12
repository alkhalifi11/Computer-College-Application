// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, prefer_final_fields, unused_field, unused_local_variable, use_build_context_synchronously, avoid_print, avoid_single_cascade_in_expression_statements, unused_import
// صفحة تسجيل الدخول

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:univapp_2/app/components/curd.dart';
import 'package:univapp_2/app/components/customtextform.dart';
import 'package:univapp_2/app/components/valid.dart';
import 'package:univapp_2/app/constant/linkapi.dart';
import 'package:univapp_2/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> fromstate = GlobalKey();

  //تعريف بيانات الحقول المطلوبة من المستخدم ادخالها
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Curd _curd = Curd();

  login() async {
    if (fromstate.currentState!.validate()) {
      var response = await _curd.postRequest(
          linkLogin, {"username": username.text, "password": password.text});
      if (response['status'] == "success") {
        sharedpref.setString("id", response['data']['id'].toString());
        sharedpref.setString("username", response['data']['username']);
        //sharedpref.setString("email", response['data']['email']);
        Navigator.of(context).pushNamedAndRemoveUntil("news", (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "تنبية",
            body: Text(
                "البريد الالكتروني او كلمة المرور غير صحيحة... يرجئ المحاولة مرة اخرئ"))
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 40,
              color: Colors.blue,
            ),
            SizedBox(
              width: 7,
            ),
            Text("تسجيل الدخول", style: Theme.of(context).textTheme.headlineMedium   ), 
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.language,
                size: 30,
              ))
        ],
        toolbarHeight: 120,
      ),
      body: Form(
        key: fromstate,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30.0, right: 30, top: 10, bottom: 30),
          child: Container(
            height: 1000,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Image.asset(
                      'images/univ_2.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 10),
                      child: CustTextForm(
                        valid: (val) {
                          return validInput(val!, 1, 50);
                        },
                        decision: false,
                        names: 'اسم المستخدم',
                        mycontroller: username,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 0, bottom: 5),
                      child: CustTextForm(
                        valid: (val) {
                          return validInput(val!, 7, 50);
                        },
                        decision: true,
                        names: 'كلمة المرور',
                        mycontroller: password,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: MaterialButton(
                        onPressed: () async {
                          await login();
                        },
                        color: Color.fromARGB(255, 9, 55, 94),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'تسجيل الدخول',
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'هل نسيت الحساب..؟',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'تواصل بنا',
                          style: TextStyle(
                            fontFamily: 'ElMessiri',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 9, 55, 94),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
