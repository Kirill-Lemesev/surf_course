import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/scroll_image.dart';

class ScrollScreen extends StatefulWidget {
  final int imageID;
  final int imagesCount;
  final List imagesList;

  const ScrollScreen(
      {super.key,
      required this.imageID,
      required this.imagesCount,
      required this.imagesList});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  static const _defaultAnimDuration = Duration(milliseconds: 300);
  late int _imageId = widget.imageID;
  late int _currentPage = widget.imageID - 1;
  late final _pageController = PageController(
    initialPage: _currentPage,
    viewportFraction: 0.7,
  );

  @override
  void initState() {
    _pageController.addListener(_onPageChanged);
    super.initState();
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final prevPage = _currentPage;

    _currentPage = _pageController.page?.round() ?? _currentPage;
    print(_currentPage);

    _imageId = _currentPage + 1;

    if (prevPage != _currentPage) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Text(
              _imageId.toString(),
              style: AppStrings.black,
            ),
            const Text(
              '/',
              style: AppStrings.gray,
            ),
            Text(
              widget.imagesCount.toString(),
              style: AppStrings.gray,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: widget.imagesCount,
          itemBuilder: (_, i) => Center(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: _currentPage == i ? 1 : 0.8,
              child: GestureDetector(
                onTap: () => _pageController.animateToPage(
                  i,
                  duration: _defaultAnimDuration,
                  curve: Curves.easeIn,
                ),
                child: ScrollImage(url: widget.imagesList[i].url, blur: i - 1 != _currentPage,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
