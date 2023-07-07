import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:first_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageScreen extends StatefulWidget{
  const StorageScreen({super.key});
  
  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen>{
  late String _resumePath;

  Future<void> downloadFile(String url) async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    PermissionStatus status;

    try{
      if(deviceInfo.version.sdkInt >= 33){
        status = await Permission.manageExternalStorage.status;
      }else{
        status = await Permission.storage.status;
      }

      if(!status.isGranted){
        if(Platform.isAndroid){
          if(deviceInfo.version.sdkInt >= 33){
            status = await Permission.manageExternalStorage.request();
          }
        }
        status = await Permission.storage.request();
      }

      if(status.isGranted){
        final appDir = await getExternalStorageDirectory();
        const fileName = 'resume.pdf';
        final savePath = "${appDir?.path}/Download/$fileName";

        final dio = Dio();
        await dio.download(url, savePath);

        setState(() {
          _resumePath = savePath;
        });

        Fluttertoast.showToast(msg: "Download successfully. $savePath");
      }else{
        Fluttertoast.showToast(msg: "Permission needed!");
      }

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      log("❌ Exception: ${e.toString()}");
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/color_green.png"),
            ElevatedButton(
              onPressed: () async{
                downloadFile(Constants.resumeUrl);
              }, 
              child: const Text("Download resume"),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              onPressed: (){
                if(Platform.isAndroid){
                  OpenFile.open(_resumePath);
                }
              }, child: const Text("View resume")),
          ],
        ),
      ),
    );
  }

}