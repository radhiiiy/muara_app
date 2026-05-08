import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              
              // 1. Logo Header dengan Garis
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Icon(Icons.chair_outlined, size: 40, color: Colors.grey),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // 2. Teks Sambutan
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Hello !',
                  style: TextStyle(fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'WELCOME BACK',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // 3. Form Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Field Email
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Field Password
                    TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          onPressed: () => setState(() => _obscureText = !_obscureText),
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Forgot Password
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16)),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Button Log in
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF242424),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Button Sign up
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}