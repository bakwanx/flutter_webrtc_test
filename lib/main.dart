import 'dart:core';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_webrtc_test/mine/video_call_page.dart';

import 'src/get_display_media_sample.dart';
import 'src/get_user_media_sample.dart'
    if (dart.library.html) 'src/get_user_media_sample_web.dart';
import 'src/loopback_data_channel_sample.dart';
import 'src/loopback_sample.dart';
import 'src/loopback_sample_unified_tracks.dart';
import 'src/route_item.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // if (WebRTC.platformIsDesktop) {
  //   debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // } else if (WebRTC.platformIsAndroid) {
  //   startForegroundService();
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: VideoCallPage(),
    );
  }
}


// Future<bool> startForegroundService() async {
//   final androidConfig = FlutterBackgroundAndroidConfig(
//     notificationTitle: 'Title of the notification',
//     notificationText: 'Text of the notification',
//     notificationImportance: AndroidNotificationImportance.Default,
//     notificationIcon: AndroidResource(
//         name: 'background_icon',
//         defType: 'drawable'), // Default is ic_launcher from folder mipmap
//   );
//   await FlutterBackground.initialize(androidConfig: androidConfig);
//   return FlutterBackground.enableBackgroundExecution();
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late List<RouteItem> items;
//
//   @override
//   void initState() {
//     super.initState();
//     _initItems();
//   }
//
//   ListBody _buildRow(context, item) {
//     return ListBody(children: <Widget>[
//       ListTile(
//         title: Text(item.title),
//         onTap: () => item.push(context),
//         trailing: Icon(Icons.arrow_right),
//       ),
//       Divider()
//     ]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Flutter-WebRTC example'),
//           ),
//           body: ListView.builder(
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(0.0),
//               itemCount: items.length,
//               itemBuilder: (context, i) {
//                 return _buildRow(context, items[i]);
//               })),
//     );
//   }
//
//   void _initItems() {
//     items = <RouteItem>[
//       RouteItem(
//           title: 'GetUserMedia',
//           push: (BuildContext context) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => GetUserMediaSample()));
//           }),
//       RouteItem(
//           title: 'GetDisplayMedia',
//           push: (BuildContext context) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) =>
//                         GetDisplayMediaSample()));
//           }),
//       RouteItem(
//           title: 'LoopBack Sample',
//           push: (BuildContext context) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => LoopBackSample()));
//           }),
//       RouteItem(
//           title: 'LoopBack Sample (Unified Tracks)',
//           push: (BuildContext context) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) =>
//                         LoopBackSampleUnifiedTracks()));
//           }),
//       RouteItem(
//           title: 'DataChannelLoopBackSample',
//           push: (BuildContext context) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) =>
//                         DataChannelLoopBackSample()));
//           }),
//     ];
//   }
// }
