import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatMediaPermissions {
  ChatMediaPermissions._();

  static Future<bool> requestPhotos() async {
    final permission = await _photosPermission();
    final status = await permission.request();
    return status.isGranted || status.isLimited;
  }

  static Future<bool> requestCamera() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> requestMicrophone() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) return true;

    status = await Permission.microphone.request();
    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }

  static Future<Permission> _photosPermission() async {
    if (Platform.isIOS) return Permission.photos;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      return Permission.photos;
    }
    return Permission.storage;
  }
}
