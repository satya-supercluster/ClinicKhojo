import 'dart:async';

import 'package:flutter/material.dart';

class SlideshowBanner extends StatefulWidget {
  const SlideshowBanner({
    super.key
  });
  @override
  State<SlideshowBanner> createState() => _SlideshowBannerState();
}

class _SlideshowBannerState extends State<SlideshowBanner> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<String> _imageUrls = [
    'assets/banner.jpg',
    'assets/banner.jpg',
    'assets/banner.jpg',
  ];

  Timer? _autoSlideTimer;
  
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    // Cancel the previous Timer if it exists
    _autoSlideTimer?.cancel();
    // Create a new Timer
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // Check if the _pageController is still attached to the widget tree
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                child: Image(
                  image:AssetImage(
                    _imageUrls[index],
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _imageUrls.length,
                (index) => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

   @override
  void dispose() {
    _pageController.dispose();
    // Cancel the Timer when the widget is disposed
    _autoSlideTimer?.cancel();
    super.dispose();
  }
}