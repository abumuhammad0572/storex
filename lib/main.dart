import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'StoreX',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreX'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Добро пожаловать в магазин!'),
              Image.asset('assets/logo.png'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondScreen()));
                  },
                  child: const Text('Товары'))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: const [
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: Colors.greenAccent,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book),
                      Text('Кораны'),
                    ],
                  )),
                ),
              ),
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: Colors.redAccent,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book),
                      Text('Тафсиры'),
                    ],
                  )),
                ),
              ),
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: Colors.blueAccent,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book),
                      Text('Хадисы'),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
