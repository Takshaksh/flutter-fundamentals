import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:first_flutter/firewire/remote_config_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FirewireScreen extends ConsumerStatefulWidget{
  const FirewireScreen({super.key});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirewireScreenState();
}

class _FirewireScreenState extends ConsumerState<FirewireScreen>{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firewire Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                fetchRemoteConfig();
              }, 
              child: const Text("Show a popup")
            ),
            ElevatedButton(
              onPressed: () async {
                final remoteConfig = FirebaseRemoteConfig.instance;

                final data = remoteConfig.getString("name");
                log("Fetched data: $data");

              }, child: const Text("remot config")
            ),
          ],
        ),
      ),
    );
  }

  fetchRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1), 
        minimumFetchInterval: const Duration(seconds: 1),
      ));

      await remoteConfig.fetchAndActivate();

      log("👌 Data: ${remoteConfig.getString("name")}");

      /* final json = remoteConfig.getAll().map((key, value) => MapEntry(key, value));
      log("Remote config all data: $json");

      final data = remoteConfig.getValue("name");
      log("Remote config value: ${data.asString()}"); */

    } catch (e) {
      log("Error fetching remote: $e");
    }
  }

}