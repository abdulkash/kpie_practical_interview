import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_practical_interview/providers/login_provider.dart';
import 'package:kpie_practical_interview/view/home_page.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            const Text("Hey you're back, fill in your details to get back in"),
            const SizedBox(height: 25),
            TextField(
              controller: username,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 2.5,
                      ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 2.5,
                      ))),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 45,
              child: ElevatedButton(
                  onPressed: () async {
                    if (username.text.isEmpty || password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All Fields are required')));
                    } else {
                      await ref.read(loginProvider.notifier).login(username.text, password.text);
                      ref.read(loginProvider).whenOrNull(
                            error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))),
                            data: (_) => Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage())),
                          );
                    }
                  },
                  child: ref.watch(loginProvider).isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const Text('Login')),
            ),
          ],
        ),
      ),
    );
  }
}
