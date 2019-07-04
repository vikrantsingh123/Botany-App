import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../assets/colors.dart';
import 'dart:convert';

import '../../widgets/buildPopularListMain.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<dynamic> items;

  getJsonData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/botany.json');
    items = json.decode(data);
  }

  List<CameraDescription> cameras;
  CameraController controller;
  double width, width1, height, height1;

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  Future<void> getCameras() async {
    Future.delayed(const Duration(seconds: 4));
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }

    print('cameras ' + cameras.toString());
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
    getCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width1 = MediaQuery.of(context).size.width;
    height1 = MediaQuery.of(context).size.height;
    width = width1 / 1000;
    height = height1 / 1000;
    if (controller == null) return Center(child: CircularProgressIndicator());
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Positioned(child: CameraPreview(controller)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 400,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(height * 20),
                        topRight: Radius.circular(height * 20)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: width * 130,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Search result',
                                style: TextStyle(
                                    color: MyColors.mainTitleColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Exist errors',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          Icon(
                            Icons.tag_faces,
                            color: MyColors.iconThemeColor,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(height * 15),
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return BuildPopularListMain(items[index]['name'],
                              items[index]['link'], height);
                        },
                      )),
                      Padding(
                        padding: EdgeInsets.all(height * 20),
                      ),
                    ],
                  ),
                ))
          ],
        )));
  }
}
