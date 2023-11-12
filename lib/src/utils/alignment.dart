class MainAxisAlignment {
  static String start = 'flex-start';
  static String end = 'flex-end';
  static String center = 'center';
  static String spaceAround = 'space-around';
  static String spaceBetween = 'space-between';
  static String spaceEvenly = 'space-evenly';
}

class CrossAxisAlignment {
  static String start = 'flex-start';
  static String end = 'flex-end';
  static String center = 'center';
  static String stretch = 'stretch';
}

class PaddingGeometry {
  String? left;
  String? right;
  String? top;
  String? bottom;
  PaddingGeometry({this.top, this.bottom, this.right, this.left});
}

class TextAlignment {}
