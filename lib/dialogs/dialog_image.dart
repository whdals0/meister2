import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DialogImage extends StatefulWidget {
  final String imgpath;

  const DialogImage({Key? key, required this.imgpath}) : super(key: key);

  @override
  State<DialogImage> createState() => _DialogImageState();
}

class _DialogImageState extends State<DialogImage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider:
                      NetworkImage(widget.imgpath.split(',').elementAt(index)),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: widget.imgpath.split(',').elementAt(index)),
                );
              },
              itemCount: widget.imgpath.split(',').length,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.expectedTotalBytes == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes!,
                  ),
                ),
              ),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black54,
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.cancel, size: 24, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
