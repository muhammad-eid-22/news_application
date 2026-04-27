import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/features/home/model/top_headlines_response.dart';
import 'package:news_app/features/home/widgets/news_card.dart';

class CustomSlider extends StatefulWidget {
  final List<Article> article;

  const CustomSlider({super.key, required this.article});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1.8,
            viewportFraction: 0.9,
            enlargeFactor: 0.2,
            clipBehavior: Clip.none,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: List.generate(
            widget.article.length,
            (index) => NewsCard(item: widget.article[index]),
          ),
        ),
        SizedBox(height: context.hg(12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.article.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 24.0 : 16.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: _current == entry.key
                      ? BorderRadius.circular(5)
                      : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: _current == entry.key
                      ? Colors.blueAccent.withValues(
                          alpha: _current == entry.key ? 0.9 : 0.4,
                        )
                      : Colors.grey.withValues(alpha: 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
