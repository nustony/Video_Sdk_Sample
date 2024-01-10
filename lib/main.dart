// import 'package:flutter/material.dart' as Theme1;
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _showVideoSDK() async {
    try {
      final audioList = [
        {
          "id": "1",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Action-Sports-Dubstep-3-(loop).wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Action Sports Dubstep 3 (loop).wav",
        },
        {
          "id": "2",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Happy-smile-939435.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Happy-smile-939435.wav",
        },
        {
          "id": "3",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-The-Last-Chapter-(Main).wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/The Last Chapter (Main).wav"
        },
        {
          "id": "4",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Let-It-Rock-Right-Now!.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Let It Rock Right Now!.wav"
        },
        {
          "id": "5",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Black-Squad.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Future Bass (main).wav"
        },
        {
          "id": "6",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Hip-Hop-Upbeat-Positive-(Main-version)",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/128k-Trap-Bass-Beat-(168-BPM)-(01-26-SEC)-WAV.wav"
        },
        {
          "id": "7",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Always-on-top-957705.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Best Place To Sports (main - 1min49sec).wav"
        },
        {
          "id": "8",
          "urlLowQuality":"https://vh0images.blob.core.windows.net/music/128k-Light-Road_full-version.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Light Road_full version.wav",

        },
        {
          "id": "9",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Olympic-Golden-Awards.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Digital-future-956500.wav"
        },
        {
          "id": "10",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Harder-Better-and-Faster_version-1.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Olympic Golden Awards.wav"
        },
        {
          "id": "11",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Hip-Hop-.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Harder Better and Faster_version 1.wav"
        },
        {
          "id": "12",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Book-Store-On-Broadway.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Hip-Hop.wav",
        },
        {
          "id": "13",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Book-Store-On-Broadway.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Book Store On Broadway.wav"
        },
        {
          "id": "14",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Dancing-in-zimbabwe-951859.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Dancing-in-zimbabwe-951859.wav",
        },
        {
          "id": "15",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Olympic-Golden-Awards.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Olympic Golden Awards.wav"
        },
        {
          "id": "16",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Action-Sport-Trailer.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Action Sport Trailer.wav"
        },
        {
          "id": "17",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Olympic-Golden-Awards.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Olympic Golden Awards.wav",
        },
        {
          "id": "18",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Happy-smile-939435.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Happy-smile-939435.wav",
        },
        {
          "id": "19",
          "urlLowQuality": "https://vh0images.blob.core.windows.net/music/128k-Epic-Rock-Trailer.wav",
          "urlHighQuality": "https://vh0images.blob.core.windows.net/music/Epic Rock Trailer.wav"
        }
      ];
      /*
       At first we used high quality audio format: urlHighQuality -> leading to crash on ios 16 and android (Just select the first audio file -> crash) as I said before
       then we improved and reduced the audio quality, using urlLowQuality -> it worked on ios 16, but still crashed on android when exporting video

       --- Please prioritize checking and fixing video export errors on Android when using urlLowQuality first --- Thanks!
       */
      final audioLowQualityList = audioList.map((e) => AudioClip(e["id"]!, e["urlLowQuality"]!)).toList();
      final audioHighQualityList = audioList.map((e) => AudioClip(e["id"]!, e["urlHighQuality"]!)).toList();
      final videoList = ["https://goog-staging-cdn.varsityhype.com/asset-ac7cc716-f43b-422c-ae6c-5bf67d3baeba/Video-0001278_8183f3c2-30ee-4e87-bb2e--HD-5000.mp4"];

      final configuration = Configuration(
          audio: AudioOptions(categories: [
            AudioClipCategory("custom", "Music", items: audioLowQualityList)
          ], canvasActions: [
            AudioCanvasAction.delete,
            AudioCanvasAction.playPause,
          ]),
          export: ExportOptions(
            forceExport: true,
            filename: "videoExport",
          )
      );
      final video = Video.composition(videos: videoList);
      final result = await VESDK.openEditor(video, configuration: configuration);
      print('result: $result');

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        print(result.video);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the video.
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showVideoSDK,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
