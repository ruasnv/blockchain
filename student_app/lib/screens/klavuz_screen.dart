import 'package:flutter/material.dart';

class KlavuzScreen extends StatefulWidget {
  const KlavuzScreen({super.key});

  @override
  KlavuzScreenState createState() => KlavuzScreenState();
}

class KlavuzScreenState extends State<KlavuzScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar creates a title heading on top of the page
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 37, 37),
        title: const Text(
          'MSKÜ Student Hub',
          style: TextStyle(
              color: Color.fromARGB(255, 232, 228, 228),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 48,
      ),

      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const SizedBox(height: 64),

            // Rows for the elements
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: const Text(
                  "Duyuru No:1 ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Icon(Icons.link),
                ),
              ),
            ]),

            Flexible(
              flex: 2,
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: const Text(
                    "Bir sorunuz mu var? ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        color: Color.fromARGB(255, 48, 45, 45)),
                    child: const Text(
                      "   Bize Ulaşın   ",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 12,
            ),
          ]),
        ),
      ),
    );
  }
}
