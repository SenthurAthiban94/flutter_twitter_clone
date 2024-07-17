import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeago/timeago.dart' as timeago;

class Tweetscreen extends StatefulWidget {
  const Tweetscreen({super.key});

  @override
  State<Tweetscreen> createState() => _TweetscreenState();
}

class _TweetscreenState extends State<Tweetscreen> {
  Future<void> requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    // Handle the permissions response
    if (statuses[Permission.camera]!.isDenied) {
      // Permission denied, handle it gracefully
      print('Camera permission is denied');
    }
    if (statuses[Permission.storage]!.isDenied) {
      // Permission denied, handle it gracefully
      print('Storage permission is denied');
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  final TextEditingController _tweetController = TextEditingController();
  int _remainingCharacters = 280;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _updateRemainingCharacters(String newText) {
    setState(() {
      _remainingCharacters = 280 - newText.length;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _postTweet() {
    String tweetText = _tweetController.text.trim();
    if (tweetText.isNotEmpty) {
      print('Tweet posted: $tweetText');
      if (_imageFile != null) {
        print('Image attached: ${_imageFile!.path}');
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _tweetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.black87,
        title: const Text('Tweet'),
        actions: [
          TextButton(
            onPressed: _postTweet,
            child: const Text(
              'Tweet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: CachedNetworkImageProvider(
                      'https://via.placeholder.com/150'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _tweetController,
                    onChanged: _updateRemainingCharacters,
                    maxLines: null,
                    decoration: const InputDecoration(
                        hintText: 'What\'s happening?',
                        border: InputBorder.none,
                        fillColor: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _imageFile != null
                ? Stack(
                    children: [
                      Image.file(
                        _imageFile!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              _imageFile = null;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$_remainingCharacters',
                  style: TextStyle(
                    fontSize: 16,
                    color: _remainingCharacters >= 0 ? Colors.grey : Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: _pickImage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
