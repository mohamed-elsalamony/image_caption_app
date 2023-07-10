import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 220,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onCameraTap,
                  child: Card(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(color: Colors.green),
                      child: const Text("Camera",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white)),
                    ),
                  ),
                ),
                // const SizedBox(height: 60),
                GestureDetector(
                  onTap: onGalleryTap,
                  child: Card(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(color: Colors.green),
                      child: const Text("Gallery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
