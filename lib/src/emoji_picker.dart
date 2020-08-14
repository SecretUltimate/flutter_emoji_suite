import 'package:flutter/material.dart';

import 'emoji_parser.dart';

EmojiParser defaultEmojiParse = EmojiParser();

typedef EmojiPickObserver = Function(dynamic emoji);

class EmojiPicker extends StatefulWidget {
  final EmojiParser emojiParser;
  final EmojiPickObserver emojiPickObserver;

  EmojiPicker({@required this.emojiPickObserver, this.emojiParser});

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  List _data = List();

  @override
  void initState() {
    super.initState();
    _data.addAll(widget.emojiParser?.allEmoji ?? defaultEmojiParse.allEmoji);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => widget.emojiPickObserver.call('${_data[index]}'),
                child: Center(
                  child: Text(
                    _data[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
              );
            }));
  }
}
