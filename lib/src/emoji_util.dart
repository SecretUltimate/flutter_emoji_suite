import 'emoji_const.dart';
import 'emoji_message.dart';
import 'emoji_parser.dart';

///
/// Utilities to handle emoji operations.
///
class EmojiUtil {
  ///
  /// Strip colons for emoji name.
  /// So, '[heart]' will become 'heart'.
  ///
  static String stripDivider(String name, [void onError(String message)]) {
    Iterable<Match> matches = EmojiParser.regexName.allMatches(name);
    if (matches.isEmpty) {
      if (onError != null) {
        onError(EmojiMessage.errorMalformedEmojiName);
      }
      return name;
    }
    return name.replaceAll(EmojiConst.emojiFlagStart, EmojiConst.charEmpty).replaceAll(EmojiConst.emojiFlagEnd, EmojiConst.charEmpty);
  }

  ///
  /// Wrap colons on both sides of emoji name.
  /// So, 'heart' will become '[heart]'.
  ///
  static String ensureDivider(String name) {
    String res = name;
    if (!name.startsWith(EmojiConst.emojiFlagStart, 0)) {
      res = EmojiConst.emojiFlagStart + name;
    }

    if (!name.endsWith(EmojiConst.emojiFlagEnd)) {
      res += EmojiConst.emojiFlagEnd;
    }

    return res;
  }

  ///
  /// When processing emojis, we don't need to store the graphical byte
  /// which is 0xfe0f, or so-called 'Non-Spacing Mark'.
  ///
  static String stripNSM(String name) => name.replaceAll(RegExp(EmojiConst.charNonSpacingMark), EmojiConst.charEmpty);
}
