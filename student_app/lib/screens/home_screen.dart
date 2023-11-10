import 'package:flutter/material.dart';
import 'package:student_app/screens/duyurular_screen.dart';
import 'package:student_app/screens/harita_screen.dart';
import 'package:student_app/screens/klavuz_screen.dart';
import 'package:student_app/screens/topluluklar_screen.dart';
import 'package:student_app/screens/ulas%C4%B1m_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const SizedBox(height: 64),

              // Inkwell for the elements

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DuyurularScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    'Duyurular',
                  ),
                ),
              ),

              //Sizedbox to separate the Inkwells
              const SizedBox(
                height: 18,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TopluluklarScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    'Öğrenci Toplulukları',
                  ),
                ),
              ),

              //Sizedbox to separate the Inkwells
              const SizedBox(
                height: 18,
              ),

              //text field input for Password

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HaritaScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    'Kampüs Haritası',
                  ),
                ),
              ),

              //Sizedbox to separate floor with password box
              const SizedBox(
                height: 18,
              ),

              //button login
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UlasimScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    'Ulaşım',
                  ),
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KlavuzScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      color: Color.fromARGB(255, 48, 45, 45)),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    ' Yaşam Kılavuzu ',
                  ),
                ),
              ),

              //Sizedbox to separate the Inkwells
              const SizedBox(
                height: 18,
              ),

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
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
