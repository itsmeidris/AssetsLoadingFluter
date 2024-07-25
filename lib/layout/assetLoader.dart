import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:loading_assets/widgets/introTextWidget.dart';
import 'package:loading_assets/widgets/imageWidget.dart';
import 'package:loading_assets/widgets/dataLoader.dart';

class Assetloader extends StatefulWidget {
  const Assetloader({super.key});

  @override
  AssetloaderState createState() => AssetloaderState();
}

class AssetloaderState extends State<Assetloader> {
  //A class level variable where we going to store the loaded text content
  String myLoadedTextContent = '';
  String myLoadedImage = "assets/images/form.webp";

  @override
  void initState() {
    //A lifecycle method that is callded when it gets created and inserted in the widget tree
    super.initState();
    _loadTextAsset();
  }

  //A cutom method responsible for loading the text content
  Future<void> _loadTextAsset() async {
    //The rootBundle in Flutter is a singleton object that provides access to the application's asset bundle.
    //loadString(String key): Asynchronously loads the contents of a text asset file.
    String content = await rootBundle.loadString('assets/data/introText.txt');
    setState(() {
      //Notifying the flutter framework that the widget has changed triggering a rebuilding and updating the UI.
      myLoadedTextContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          SizedBox(
            height: (height * 0.03),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Loading text asset',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 8.0),
                child: Introtextwidget(myText: myLoadedTextContent),
              ),
            ],
          ),
          SizedBox(
            height: (height * 0.03),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Loading image asset',
                style: TextStyle(
                  fontSize: 35
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 8.0),
                child: Imagewidget(image: myLoadedImage),
              ),
            ],
          ),
          SizedBox(
            height: (height * 0.04),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loading local data asset',
                style: TextStyle(
                  fontSize: 35
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top : 8.0),
                child: SizedBox(
                    width: double.infinity, 
                    height: 400, 
                    child: Dataloader()
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
