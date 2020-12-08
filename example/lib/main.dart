import 'package:flutter/material.dart';
import 'package:flutter_emoji_suite/flutter_emoji_suite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Emoji Suite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlutterEmojiSuiteDemo(),
    );
  }
}

class FlutterEmojiSuiteDemo extends StatefulWidget {
  @override
  _FlutterEmojiSuiteDemoState createState() => _FlutterEmojiSuiteDemoState();
}

class _FlutterEmojiSuiteDemoState extends State<FlutterEmojiSuiteDemo> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Emoji Suite Demo'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Text('${emojiParser.unemojify(controller.text)}'),
            Text('${emojiParser.emojify(emojiParser.unemojify(controller.text))}'),
            Expanded(
              child: EmojiPicker(
                emojiPickObserver: (dynamic emoji) {
                  setState(() {
                    controller.text = '${controller.text}$emoji';
                  });
                },
                emojiParser: emojiParser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

EmojiParser emojiParser = EmojiParser(customEmoji: '{"开心":"😀","呲牙":"😁","笑哭":"😂"}');
