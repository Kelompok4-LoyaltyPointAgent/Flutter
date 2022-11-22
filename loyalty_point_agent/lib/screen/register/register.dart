import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 100, bottom: 20),
                child: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(209, 219, 217, 1),
                  minRadius: 50,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Anda Sudah Memiliki Akun ? '),
                  InkWell(
                    child: const Text(
                      'Masuk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Username'),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ex. Ahmad Krisdiantoro',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Email'),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ex. example@gmail.com',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
              child: const Text(
                'Daftar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
