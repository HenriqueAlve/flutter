import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carrosel extends StatelessWidget {
  const Carrosel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/pizza.png',
      'assets/images/torta.png',
      'assets/images/doces.png',
    ];

    return Container(
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            scrollDirection: Axis.horizontal,
          ),
          items: imgList
              .map((item) => Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(15), // Borda arredondada
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Ajuste o raio do recorte
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
