import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restuarant/splash/HomePage.dart';
import 'package:restuarant/splash/loginpage.dart';
import 'package:restuarant/splash/signup.dart';
import 'package:restuarant/splash/splash_1.dart';
import 'Splash/Editprofilepage.dart';
import 'Splash/Profilepage.dart';
import 'Splash/Settingpage.dart';
import 'Splash/breakfastpage.dart';
import 'Splash/foodcard.dart';
import 'Splash/foodsection.dart';
import 'Splash/settings_2.dart';

main()async {
  runApp(Myapp());
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(options: FirebaseOptions(

    apiKey: "AIzaSyAf8gpy0NsaxpuhN5SX-gcSVRIpgDAWsNw",

    authDomain: "restaurant-938.firebaseapp.com",

    projectId: "restaurant-938",

    storageBucket: "restaurant-938.appspot.com",

    messagingSenderId: "266858569912",

    appId: "1:266858569912:web:fb2b08d1ad060983e2544d",

    measurementId: "G-KVHD8LMVN3"

)

  );

}
final themeMode = ValueNotifier(2);

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          home: breakfast(),
        );
      },
      valueListenable: themeMode,
    );
  }
}
// class classes extends StatefulWidget {
//   const classes({Key? key}) : super(key: key);

//   @override
//   State<classes> createState() => _classesState();
// }

// class _classesState extends State<classes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 200,
//         width: 100,
//         child: CustomCard(title: "ghgjh",description: "rttyryty",
//         price: "2334",image: "https://img.freepik.com/premium-photo/appam-velliappam-kallappam-paalappam-tasty-delicious-breakfast-item-south-india-with-good-combination-kadala-curry-bengal-gram-curry-placed-white-background_527904-2533.jpg?w=996"),
//       ),
//     );
//   }
// }
