import 'package:flutter/material.dart';
import 'package:textfield/pages/login.dart';

class Signup extends StatelessWidget {
  TextEditingController passwordController = new TextEditingController();
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
                  width: double.infinity,
                  height: 250,
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 40,
                  )),
              SizedBox(height: 40),
              const Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 64, 200, 187),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildEmailField(),
              const SizedBox(height: 10),
              _buildPasswordField(),
              const SizedBox(height: 10),
              _buildConfirmPasswordField(),
              SizedBox(height: 10),
              _buildLoginButton(),
              SizedBox(height: 80),
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
          controller: passwordController,
          showCursor: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (pass) {
            if (pass == null || pass.isEmpty) {
              return 'Password cannot be empty';
            }
            if (pass.length < 8) {
              return 'Password cannot be less than 8 characters';
            }
            if (!(pass.contains(RegExp(r'[A-Z]')) &&
                pass.contains(RegExp(r'\d')) &&
                pass.contains(RegExp(r'[@#$%^&*!]')))) {
              return "Password should contain digits, uppercase letters, and special characters";
            }

            return null;
          },
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

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4.0,
        shadowColor: Colors.grey,
        child: TextFormField(
          showCursor: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (confirmpass) {
            if (confirmpass != passwordController) {
              return 'password doesnot match';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "  ConfirmPassword",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          obscuringCharacter: '*',
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: MaterialButton(
            color: Color.fromARGB(255, 64, 200, 187),
            minWidth: 100,
            onPressed: () {},
            child: const Text(
              'Sign up',
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
            return Login();
          }));
        },
        child: const Text(
          "LOGIN",
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
