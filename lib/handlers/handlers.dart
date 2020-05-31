import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GetPermission {
  Future<List<Directory>> externalStorage = getExternalStorageDirectories();
  static  Permission permissionHandler = Permission.storage;
  PermissionStatus permissionStatus;

  Future<void> get requestPermission async {
    final status = await permissionHandler.request();
    print(status);
    
  }

  List<String> getFileList() {
    Directory dir = Directory('/storage/emulated/0/');
    String pathX = dir.toString();
    List<FileSystemEntity> pdfFileX = [];
    List<String> fileNames = [];
    print(pathX);

    List<FileSystemEntity> fileX;
    fileX = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in fileX) {
      String path = entity.path;
      pdfFileX.add(entity);
      if (path.endsWith('pdf')) {
        print(path);
        fileNames.add(path);
      }
    }
    return fileNames;
  }
}
