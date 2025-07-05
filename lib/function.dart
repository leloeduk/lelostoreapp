import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  File? _apkFile;

  Future<bool> pickApkFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['apk'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        if (!mounted) return false;

        setState(() {
          _apkFile = file;
        });
        return true;
      } else {
        return false; // annulation
      }
    } catch (e) {
      debugPrint('Erreur lors de la sélection de fichier : $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sélecteur APK')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                bool success = await pickApkFile();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Fichier APK sélectionné : ${_apkFile?.path.split('/').last}'
                          : 'Sélection annulée ou erreur',
                    ),
                  ),
                );
              },
              child: const Text('Choisir un fichier APK'),
            ),
            if (_apkFile != null) ...[
              const SizedBox(height: 20),
              Text('Fichier choisi : ${_apkFile!.path.split('/').last}'),
            ],
          ],
        ),
      ),
    );
  }
}
