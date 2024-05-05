import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String generateMarvelHash(String publicKey, String privateKey) {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final preHash = ts + privateKey + publicKey;
    return generateMd5(preHash);
  }
}
