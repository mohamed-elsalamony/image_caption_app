class ImageCaption {
  final String? caption;

  ImageCaption({
    required this.caption,
  });
  factory ImageCaption.fromjson(Map<String,dynamic> jsonData) {
    print(jsonData);
    if (jsonData != null && jsonData["caption"] != null) {
      return ImageCaption(caption: jsonData["caption"]);
    } else {
      throw FormatException("Invalid JSON data");
    }
  }
}
