import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project123/RouteConstants.dart';
import 'package:project123/service/firebase_auth_service.dart';

class Login extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: Center(
          child: Container(
            width: kIsWeb ? MediaQuery.of(context).size.width / 1.5 : MediaQuery.of(context).size.width,
            height: kIsWeb ? MediaQuery.of(context).size.height / 1.5 : MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Wrap(children: [
                  FractionallySizedBox(
                    widthFactor: kIsWeb ? 0.5 : 1,
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: kIsWeb ? Colors.deepOrange.shade300.withOpacity(0.4) : Colors.green.shade200.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            padding: kIsWeb ? EdgeInsets.zero : EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kIsWeb ? SizedBox(height: 10) : SizedBox(height: 10),
                                kIsWeb
                                    ? SizedBox.shrink()
                                    : Center(
                                  child: Image.network(
                                    'assets/image/login.png',
                                    height: 300,
                                  ),
                                ),
                                Text("Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                        color: Colors.indigo.shade900)),
                                SizedBox(height: 5),

                                Text('Email Address',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20, left: 0),
                                  child: SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: _emailAddressController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:Colors.black)
                                        ),
                                        hintText: 'you@example.com',
                                        hintStyle: TextStyle(color: Colors.blueGrey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text('Password',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20, left: 0),
                                  child: SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),

                                        ),
                                        hintText: 'Enter six characters or more',
                                        hintStyle: TextStyle(color: Colors.blueGrey)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //     Checkbox(
                                //       checkColor: Colors.black,
                                //       activeColor: Colors.blueGrey,
                                //       value: first,
                                //       onChanged: (bool? value) {
                                //         setState(() {
                                //           first = value!;
                                //         });
                                //       },
                                //       side: BorderSide(color: Colors.black),
                                //     ),
                                //     Text(
                                //       'Remember me',
                                //       style: TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.w500,
                                //           color: Colors.black),
                                //     ),
                                //     Spacer(),
                                //     Text('Forgot your password?',
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //         color: Colors.blueGrey,
                                //         decoration: TextDecoration.underline,
                                //         fontWeight: FontWeight.w500,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed('/register'),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Don't have an account yet?",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue.shade900,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Sign Up",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue.shade900,
                                                decoration: TextDecoration.underline),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  height: 45,
                                  width: constraints.maxWidth,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20, left: 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 3,
                                        backgroundColor: Colors.deepOrange.shade200,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final email = _emailAddressController.text;
                                        final password = _passwordController.text;
                                        final firebaseAuthService = FirebaseAuthService();
                                        User? user = await firebaseAuthService.loginWithEmailandPassword(email, password);
                                        if(user != null) {
                                          print('login success');
                                          Navigator.of(context).pushNamed('/Dashboard');
                                        } else{
                                          print('Login failed');
                                        }
                                        // Navigator.pushNamed(context, RouteConstants.DashRoute);
                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  kIsWeb
                      ? FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade200.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageluffy1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),


                        // child: SvgPicture.network('https://svgur.com/i/yCT.svg'),


                    ),
                  )
                      : SizedBox.shrink(),
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
