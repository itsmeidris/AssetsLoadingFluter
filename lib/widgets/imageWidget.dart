import 'package:flutter/material.dart';

class Imagewidget extends StatefulWidget {
  final String image;

  const Imagewidget({
    super.key,
    required this.image,
  });

  @override
  ImagewidgetState createState() => ImagewidgetState();
}

class ImagewidgetState extends State<Imagewidget> {
  //Tracking whether the image is loading or not
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      //The _loadImage() method uses precacheImage() to preload the image 
      //and set the _isLoading variable accordingly.
      await precacheImage(AssetImage(widget.image), context);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            //The FadingImage widget in Flutter is a custom widget 
            //that provides a simple way to create a fading animation when an image is loaded. 
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif', 
              fadeInCurve: Curves.easeInOut,
              fadeInDuration: Durations.long2,
              image: widget.image
            ) 
          );
  }
}
