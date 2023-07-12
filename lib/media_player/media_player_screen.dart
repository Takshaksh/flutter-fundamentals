import 'package:first_flutter/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class MediaPlayerScreen extends ConsumerStatefulWidget {
  const MediaPlayerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends ConsumerState<MediaPlayerScreen> {
  late VideoPlayerController _playerController;
  bool _isPlaying = false;
  double _sliderValue = 0.0;
  int _skipSeconds = 10;

  void _togglePlayPause(){
    setState(() {
      if(_playerController.value.isPlaying){
        _playerController.pause();
        _isPlaying = false;
      }else{
        _playerController.play();
        _isPlaying = true;
      }
    });
  }

  void _skipBackward(){
    Duration currentPosition = _playerController.value.position;
    Duration skipDuration = Duration(seconds: _skipSeconds);
    Duration newDuration = currentPosition - skipDuration;
    _playerController.seekTo(newDuration);
  }
  
  void _skipForward(){
    Duration currentPosition = _playerController.value.position;
    Duration skipDuration = Duration(seconds: _skipSeconds);
    Duration newDuration = currentPosition + skipDuration;
    _playerController.seekTo(newDuration);
  }

  void _onSliderChanged(double value){
    setState(() {
      _sliderValue = value;
      final duration = _playerController.value.duration;
      final newPosition = duration * value;
      _playerController.seekTo(newPosition);
    });
  }


  @override
  void initState() {
    super.initState();

    _playerController = VideoPlayerController.asset(AssetsManager.video);
    _playerController.setLooping(true);
    _playerController.addListener(() { 
      setState(() {
        _sliderValue = _playerController.value.position.inMilliseconds / _playerController.value.duration.inMilliseconds;
      });
    });
    _playerController.initialize().then((_) {
      setState(() {});
      _playerController.play();
    });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Player"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              child: VideoPlayer(_playerController),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _togglePlayPause, 
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                IconButton(
                  onPressed: _skipBackward, 
                  icon: const Icon(Icons.replay_10)
                ),
                IconButton(
                  onPressed: _skipForward, 
                  icon: const Icon(Icons.forward_10)
                ),
                Expanded(
                  child: Slider(
                    min: 0.0,
                    max: 1.0,
                    value: _sliderValue, 
                    onChanged: _onSliderChanged,
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
