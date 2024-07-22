import 'package:flutter/material.dart';
import 'package:textfield/pages/signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 272,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 64, 200, 187),
                      Color.fromARGB(255, 85, 193, 229)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 40),
              const Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 64, 200, 187),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              SizedBox(height: 15),
              _buildForgotPasswordAndLoginButton(),
              SizedBox(height: 100),
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4.0,
        shadowColor: Colors.grey,
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "  Email",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }

            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4.0,
        shadowColor: Colors.grey,
        child: TextFormField(
          showCursor: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "  Password",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          obscuringCharacter: '*',
        ),
      ),
    );
  }

  Widget _buildForgotPasswordAndLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: Color.fromARGB(255, 64, 200, 187)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: MaterialButton(
            color: Color.fromARGB(255, 64, 200, 187),
            minWidth: 100,
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      child: MaterialButton(
        color: Color.fromARGB(255, 64, 200, 187),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Signup();
          }));
        },
        child: const Text(
          "SIGN UP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
