import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_story_editor/src/const/const.dart';
import 'package:flutter_story_editor/src/controller/controller.dart';
import 'package:flutter_story_editor/src/utils/utils.dart';

import 'sticker_top_view.dart';

class StickerControlView extends StatefulWidget {
  final FlutterStoryEditorController controller;
  final Function(String) onStickerClickListener;
  const StickerControlView(
      {super.key, required this.controller, required this.onStickerClickListener});

  @override
  State<StickerControlView> createState() => _StickerControlViewState();
}

class _StickerControlViewState extends State<StickerControlView> {
  bool isEmoji = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.black12.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20.0, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StickerTopView(controller: widget.controller),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEmoji = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: isEmoji == false
                                ? Colors.white
                                : const Color.fromRGBO(30, 36, 40, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Stickers",
                              style: TextStyle(
                                  color: isEmoji == false ? Colors.black : Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEmoji = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: isEmoji == true
                                ? Colors.white
                                : const Color.fromRGBO(30, 36, 40, 1),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Emoji",
                              style: TextStyle(
                                  color: isEmoji == true ? Colors.black : Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isEmoji == true ? "Emojis" : "Cuppy",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              if (isEmoji == false)
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2),
                    physics: const ScrollPhysics(),
                    itemCount: Consts.stickers.length,
                    itemBuilder: (context, index) {
                      final String sticker = Consts.stickers[index];
                      String path = "assets/images/$sticker";
                      // print("Loading sticker: assets/images/$sticker");
                      return GestureDetector(
                        onTap: () {
                          widget.onStickerClickListener(path);
                        },
                        child: FutureBuilder(
                          future: loadAsset(path), // Carga de recursos de forma asíncrona
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // Mostrar marcador de posición durante la carga
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Mostrar mensaje de error si la carga falla
                              return const Icon(Icons.error);
                            } else {
                              // Mostrar imagen si la carga es exitosa
                              // return Image(image: AssetImage(path, package: FlutterStoryEditor.assetPackageName ), width: 28);
                              // return Image.asset(path, width: 28);
                              return imageOnPackName(path);
                            }
                          },
                        ),
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2),
                    physics: const ScrollPhysics(),
                    itemCount: Consts.emojies.length,
                    itemBuilder: (context, index) {
                      final String emoji = Consts.emojies[index];
                      String path = "assets/emojies/$emoji";
                      // print("Loading emoji: assets/emojies/$emoji");
                      return GestureDetector(
                        onTap: () {
                          widget.onStickerClickListener(path);
                        },
                        child: FutureBuilder(
                          future: loadAsset(path), // Carga de recursos de forma asíncrona
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // Mostrar marcador de posición durante la carga
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Mostrar mensaje de error si la carga falla
                              return const Icon(Icons.error);
                            } else {
                              // Mostrar imagen si la carga es exitosa
                              return imageOnPackName(path);
                            }
                          },
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
