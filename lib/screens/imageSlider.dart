import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

final List<String> imgPath = [
  "assets/1.png",
  "assets/3.png",
  "assets/4.png",
];

late List<Widget> _pages;

int _activePage = 0;

final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

class _ImageSliderState extends State<ImageSlider> {
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imgPath.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(microseconds: 500), curve: Curves.easeIn);
      } else {
        _pageController.nextPage(
            duration: Duration(microseconds: 500), curve: Curves.easeOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
        imgPath.length, (index) => imagePlaceholder(imgPath: imgPath[index]));
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgPath.length,
                onPageChanged: (value) {
                  setState(() {
                    _activePage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),
          ]),
        Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: Duration(microseconds: 1000),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: _activePage == index
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                        )),
              ),
            ),
          
        ],
      ),
    );
  }
}

class imagePlaceholder extends StatelessWidget {
  final String? imgPath;
  const imagePlaceholder({super.key, this.imgPath});
//Image.asset(,fit: BoxFit.cover,)
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath!,
      fit: BoxFit.cover,
    );
  }
}
