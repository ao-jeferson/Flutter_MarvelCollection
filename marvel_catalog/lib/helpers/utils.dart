import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

//var hash = CryptoJS.MD5(timestamp + privatekey+ publicKey);
  static String generateMarvelHash(
      String ts, String publicKey, String privateKey) {
    final preHash = ts + privateKey + publicKey;
    return generateMd5(preHash);
  }
}
