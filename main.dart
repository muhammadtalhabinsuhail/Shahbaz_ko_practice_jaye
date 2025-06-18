// // import 'package:application/Screensdetails.dart';

// import 'package:application/Screens/ApiProduct.dart';
// // import 'package:application/Screens\signup.dart';
// // import 'package:application/Screens\dynamicList.dart';
// // import 'package:application/Screens\product.dart';
// // import 'package:application/Screens\firstScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'custom_plugin.dart';
// import 'package:flutter/cupertino.dart';


// void main() {
//   runApp(
    
//     DevicePreview(
//       enabled: true,
//       tools: const [
//         ...DevicePreview.defaultTools,
//         CustomPlugin(),
//       ],
//       builder: (context) => const ApiProduct(),
//     ),
//   );
// }










// // void main(){

// // DevicePreview(
// // enabled: true,
// // tools: [
// //   ...DevicePreview.defaultTools
// // ],
// // builder: (context) => ApiProduct(),
// // );

// //   runApp(
// //     MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: ApiProduct(),
// //     ),
// //   );
// // }










import 'package:application/Screens/Pro_upload.dart';
import 'package:application/Screens/addproduct.dart';
import 'package:application/Screens/products.dart';
import 'package:application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


// import 'package:application/Screens/music.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';  // Add this import
 import 'package:application/Screens/darazScreen.dart';
// Screens
import 'package:application/Screens/billcalculator.dart';
// import other screens as needed
// import 'package:application/Screens/details.dart';
// import 'package:application/Screens/darazScreen.dart';
// import 'package:application/Screens/signup.dart';
// import 'package:application/Screens/dynamicList.dart';
// import 'package:application/Screens/product.dart';
// import 'package:application/Screens/firstScreen.dart';


// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );

void main()async {

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        "/products": (context) => Products(),
        "/add": (context) => Addproduct(),
      },
       home: Products(),
      debugShowCheckedModeBanner: false,
    );
  }
}