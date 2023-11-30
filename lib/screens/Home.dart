import 'package:exam_app/screens/Exam_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> images = [
  "assets/react.png",
  "assets/php.png",
  "assets/node.png",
  "assets/vue.png",
  "assets/html.png",
];
List<String> courses = ["react", "php", "node", "vue", "html"];
List<String> description = [
  "React is a JavaScript library for building user interfaces. It allows developers to create reusable UI components and efficiently update and render the user interface in response to changes.",
  "PHP is a server-side scripting language designed for web development. It is widely used for creating dynamic and interactive web pages, handling forms, managing databases, and more.",
  "Node.js is a runtime environment that allows developers to run JavaScript on the server side. It provides an event-driven, non-blocking I/O model, making it efficient for building scalable network applications.",
  "Vue.js is a progressive JavaScript framework for building user interfaces. It focuses on the view layer and is designed to be incrementally adoptable. Vue is known for its simplicity and flexibility.",
  "HTML (Hypertext Markup Language) is the standard markup language for creating web pages and web applications. It defines the structure and content of a web page using elements and attributes."
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text(
          "Exam App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < images.length; i++)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 200, // Adjust the size as needed
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipOval(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Image.asset(
                              images[i],
                              width: 150, // Adjust the size as needed
                              height: 150, // Adjust the size as needed
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              description[i],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueGrey,
                              // shape: BoxShape.circle,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.to(const Exam_Screen(),
                                    arguments: courses[i]);
                              },
                              child: const Text(
                                'Take The Exam',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
