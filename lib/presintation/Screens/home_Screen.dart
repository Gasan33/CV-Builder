import 'package:cv_builder/Constants/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   'lottie/cv.json',
            //   fit: BoxFit.contain,
            //   animate: true,
            //   height: 100.0,
            //   width: MediaQuery.of(context).size.width / 2,
            //   //width: double.minPositive,
            // ),
            Text(
              "Tap '+' to create your CV",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   color: Colors.grey,
            //   alignment: Alignment.centerRight,
            //   margin: const EdgeInsets.only(top: 64),
            //   child: Lottie.asset(
            //     'lottie/arrow3.json',
            //     fit: BoxFit.contain,
            //     animate: true,
            //     height: 100.0,
            //   ),
            //  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Make New CV',
        child: const Icon(Icons.add),
      ),
    );
  }
}
