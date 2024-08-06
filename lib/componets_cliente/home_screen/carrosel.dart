import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Carrosel extends StatefulWidget {
  const Carrosel({super.key});

  @override
  _CarroselState createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
  late List<VideoPlayerController> _controllers;
  int _currentIndex = 0; // Índice do slide atual

  @override
  void initState() {
    super.initState();

    _controllers = [
      VideoPlayerController.asset('assets/videos/video_marmitex.mp4'),
      VideoPlayerController.asset('assets/videos/video_pizza.mp4'),
      VideoPlayerController.asset('assets/videos/video_lanche.mp4'),
    ];

    // Inicialize os controladores e prepare os vídeos
    Future.wait(_controllers.map((controller) => controller.initialize()))
        .then((_) {
      setState(() {
        // Todos os vídeos foram inicializados
        for (var controller in _controllers) {
          controller.setLooping(true); // Repetição automática
        }
      });
    }).catchError((error) {
      print('Erro ao inicializar o vídeo: $error');
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.pause();
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 380 / 200,
            autoPlayInterval: Duration(seconds: 6),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                _updateVideoPlayback();
              });
            },
          ),
          itemCount: _controllers.length,
          itemBuilder: (context, index, realIndex) {
            final controller = _controllers[index];
            final isCurrentVideo = index == _currentIndex;

            if (isCurrentVideo) {
              controller.play();
            } else {
              controller.pause();
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: 380 / 200,
                        child: VideoPlayer(controller),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }

  void _updateVideoPlayback() {
    for (var i = 0; i < _controllers.length; i++) {
      final controller = _controllers[i];
      if (i == _currentIndex) {
        controller.play();
      } else {
        controller.pause();
      }
    }
  }
}
