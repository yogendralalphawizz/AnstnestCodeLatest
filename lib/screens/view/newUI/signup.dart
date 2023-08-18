import 'package:ez/screens/view/newUI/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ez/block/signup_bloc.dart';
import 'package:ez/constant/global.dart';
import 'package:ez/constant/sizeconfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:ez/strings/strings.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ProgressDialog? pr;

  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(color: appColorWhite),
      child: Scaffold(
        backgroundColor: appColorWhite,
        appBar: AppBar(
            backgroundColor: appColorWhite,
            elevation: 0,
            title: Text(
              "",
              style: TextStyle(
                  fontSize: 20,
                  color: appColorBlack,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                child: Icon(Icons.arrow_back_ios,color: backgroundblack,),
              ),
            ) ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _signupForm(context),
          ],
        ),
      ),
    );
  }

  Widget _signupForm(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              applogo(),
              Container(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Signup",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'OpenSansBold',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(height: 30.0),
              _userTextfield(context),
              Container(height: 10.0),
              _mobileTextfield(context),
              Container(height: 10.0),
              _emailTextfield(context),
              // Container(height: 10.0),
              // _passwordTextfield(context),
              Container(height: 40.0),
              _loginButton(context),
              Container(height: 40.0),
              _dontHaveAnAccount(context),
              Container(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element

  Widget applogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/auth2.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _userTextfield(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomtextField(
        controller: _unameController,
        maxLines: 1,
        labelText: "User Name",
        hintText: "Enter User Name",
        textInputAction: TextInputAction.next,
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _mobileTextfield(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomtextField(
        controller: _mobileController,
        maxLength: 10,
        labelText: "Mobile",
        hintText: "Enter User Mobile No",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        prefixIcon: Icon(Icons.call),
      ),
    );
  }

  Widget _passwordTextfield(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomtextField(
        controller: _passwordController,
        maxLines: 1,
        labelText: "Password",
        hintText: "Enter Password",
        obscureText: !_obscureText,
        textInputAction: TextInputAction.next,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }

  Widget _emailTextfield(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomtextField(
        controller: _emailController,
        maxLines: 1,
        labelText: "Email",
        hintText: "Enter Email",
        textInputAction: TextInputAction.next,
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: InkWell(
        onTap: () {
          _signup(context);
        },
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundblack,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 50.0,
              // ignore: deprecated_member_use
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appColorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  // Widget _loginButton(BuildContext context) {
  //   return SizedBox(
  //     height: 55,
  //     width: MediaQuery.of(context).size.width - 105,
  //     child: CustomButtom(
  //       title: 'SIGNUP',
  //       color: Colors.white,
  //       onPressed: () {
  //         // Navigator.push(
  //         //   context,
  //         //   MaterialPageRoute(builder: (context) => SignUp()),
  //         // );
  //         _signup(context);
  //         print('Button is pressed');
  //       },
  //     ),
  //   );
  // }

  Widget _dontHaveAnAccount(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have an account? ",
        style: TextStyle(
          fontSize: 15,
          color: appColorBlack,
          fontWeight: FontWeight.w700,
        ),
        children: <TextSpan>[
          TextSpan(
            recognizer: new TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Login(),
                    ),
                  ),
            text: ' Sign in',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _signup(BuildContext context) {
    closeKeyboard();

    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr?.style(message: 'Loading please wait...');
    // pr?.style(
    //   message: 'Please wait...',
    //   borderRadius: 10.0,
    //   backgroundColor: Colors.white,
    //   progressWidget: Container(
    //     height: 10,
    //     width: 10,
    //     margin: EdgeInsets.all(5),
    //     child: CircularProgressIndicator(
    //       strokeWidth: 2.0,
    //       valueColor: AlwaysStoppedAnimation(Colors.blue),
    //     ),
    //   ),
    //   elevation: 10.0,
    //   insetAnimCurve: Curves.easeInOut,
    //   progressTextStyle: TextStyle(
    //       color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //   messageTextStyle: TextStyle(
    //       color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    // );
    print("checking input ${_unameController.text} and ${_passwordController.text} and ${_emailController.text} and ${_mobileController.text}");
    if (_unameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern.toString());
      if (regex.hasMatch(_emailController.text)) {
        pr?.show();
        // Loader().showIndicator(context);

        signupBloc
            .signupSink(
          _emailController.text,
          _passwordController.text,
          _unameController.text,
          _mobileController.text,
        )
            .then(
          (userResponse) {
            print("checking data here ${userResponse.responseCode} ");
            if (userResponse.responseCode == Strings.responseSuccess) {
              // String userResponseStr = json.encode(userResponse);
              // preferences.setString(
              //     SharedPreferencesKey.LOGGED_IN_USERRDATA,
              //     userResponseStr);
              pr?.hide();
              Fluttertoast.showToast(msg: "USER REGISTER SUCCESSFULLY");
              signupBloc.dispose();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );

            } else if (userResponse.responseCode == '0') {
              pr?.hide();
              loginerrorDialog(context, "Email id already registered");
            } else {
              pr?.hide();
              loginerrorDialog(
                  context, "Make sure you have entered right credentials");
            }
          },
        );
      } else {
        loginerrorDialog(
            context, "Make sure you have entered right credential");
      }
    } else {
      loginerrorDialog(context, "Please enter valid credential to sign up");
    }
  }
}
