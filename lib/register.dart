import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project123/RouteConstants.dart';
import 'package:project123/service/firebase_auth_service.dart';
import 'package:project123/service/firebase_database_service.dart';

import 'model/userModel.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _formKey = GlobalKey<FormState>();
  final _fullNameController=TextEditingController();
  final _emailAddressController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _passwordController=TextEditingController();
  final _streetAddressController=TextEditingController();
  final _emailRegexPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: Center(
          child: Container(
            width: kIsWeb ? MediaQuery.of(context).size.width / 1.25 : MediaQuery.of(context).size.width,
            height: kIsWeb ? MediaQuery.of(context).size.height / 1.25 : MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Wrap(
                    children: [
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
                                  child: Image.asset(
                                    'assets/images/wave2.jpg',
                                    height: 300,
                                  ),
                                ),
                                Text("Register",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                        color: Colors.indigo.shade900)),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _fullNameController,
                                  keyboardType: TextInputType.name,
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter full name',
                                  ),
                                  validator: (fullNameValue){
                                    if (fullNameValue==null || fullNameValue.trim().isEmpty){
                                      return 'Please Enter Full Name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _emailAddressController,
                                  maxLength: 30,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email address',
                                  ),
                                  validator: (emailValue){
                                    if (emailValue==null || emailValue.trim().isEmpty){
                                      return 'Please enter your email address';
                                    }
                                    final regex= RegExp(_emailRegexPattern);
                                    if (!regex.hasMatch(emailValue)){
                                      return'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 5),
                                SizedBox(
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

                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your phone number',
                                  ),
                                  validator: (phoneNumberValue){
                                    if (phoneNumberValue==null || phoneNumberValue.trim().isEmpty){
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _streetAddressController,
                                  keyboardType: TextInputType.streetAddress,
                                  maxLength: 20,
                                  maxLines: 1, //lines or height of box
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your address',
                                  ),
                                  validator: (streetAddressValue){
                                    if (streetAddressValue==null || streetAddressValue.trim().isEmpty){
                                      return 'Please Enter address';
                                    }
                                    return null;
                                  },
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(RouteConstants.loginRoute),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Already have an account?",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue.shade900,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Login",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.pink.shade900,
                                                decoration: TextDecoration.underline),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(height: 10),
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
                                      onPressed: ()  async{
                                        if(_formKey.currentState!=null){
                                          if(_formKey.currentState!.validate()){
                                            _formKey.currentState!.save();
                                            final email = _emailAddressController.text;
                                            final password = _passwordController.text;
                                            final firebaseAuth = FirebaseAuthService();
                                            final user = await firebaseAuth.signUpUserWithEmailAndPassword(email, password);

                                            if(user!=null){
                                              final userModel = UserModel(
                                                uId: user.uid,
                                                fullName: _fullNameController.text,
                                                emailAddress: _emailAddressController.text,
                                                phoneNumber: int.parse(_phoneNumberController.text),
                                                address: _streetAddressController.text,
                                              );
                                              final firebaseDatabaseService = FirebaseDatabaseService().createUserInCloudFirebase(userModel: userModel);
                                              Navigator.pushNamed(context, '/login');
                                            } else {
                                              print("Couldn't register user");
                                            }
                                          }
                                        }
                                        // Navigator.pushNamed(context, RouteConstants.DashRoute)
                                      },
                                      child: Text(
                                        'REGISTER',
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
                            image: AssetImage('assets/images/wave2.jpg'),
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
