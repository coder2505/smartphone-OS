// import 'package:flutter/material.dart';

// class ReturnWidgets {
//   List<Widget> ifResetVisible() {
//     return [
//       GestureDetector(
//         onTap: () {
//           resetTime();
//         },
//         child: Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.black,
//           ),
//           child: Icon(color: Colors.white, Icons.refresh),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           if (pressedStart) {
//             ref.read(stopwatchstartProvider.notifier).state = false;
//             stopTime();
//           } else {
//             ref.read(stopwatchstartProvider.notifier).state = true;
//             startTime();
//           }

//           ref.read(stopwatchresetProvider.notifier).state = true;
//         },
//         child: Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.black,
//           ),
//           child: Icon(
//             color: Colors.white,
//             pressedStart ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     ];
//   }
// }
