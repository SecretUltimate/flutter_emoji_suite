import 'emoji_const.dart';
import 'emoji_util.dart';

///
/// The representation of an emoji.
/// There are three properties availables:
///   - 'name' : the emoji name (no colon)
///   - 'full' : the full emoji name. It is name with colons on both sides.
///   - 'code' : the actual graphic presentation of emoji.
///
/// Emoji.None is being used to represent a NULL emoji.
///
class Emoji {
  ///
  /// If emoji not found, the parser always returns this.
  ///
  static final Emoji none = Emoji(EmojiConst.charEmpty, EmojiConst.charEmpty);

  final String name;
  final String code;

  Emoji(this.name, this.code);

  String get full => EmojiUtil.ensureColons(this.name);

  @override
  bool operator ==(other) {
    return this.name == other.name && this.code == other.code;
  }

  @override
  int get hashCode => super.hashCode;

  Emoji clone() {
    return Emoji(name, code);
  }

  @override
  String toString() {
    return 'Emoji{name="$name", full="$full", code="$code"}';
  }
}
