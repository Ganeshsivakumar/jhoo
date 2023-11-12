import 'dart:html';
import 'package:jhoo/jhoo.dart';

class TextStyle {
  String? fontSize;
  String? fontWeight;
  String? fontFamily;
  String? textColor;
  TextStyle({this.fontSize, this.fontWeight, this.fontFamily, this.textColor});
}

///Padding takes a child and adds space around it
class Padding implements DomElement {
  PaddingGeometry geometry;
  DomElement? child;
  Padding({this.child, required this.geometry});
  @override
  Element build() {
    DivElement div = DivElement();
    if (child == null) {
      return div;
    } else {
      Element childElement = child!.build();
      childElement.style.paddingLeft = geometry.left;
      childElement.style.paddingRight = geometry.right;
      childElement.style.paddingTop = geometry.top;
      childElement.style.paddingBottom = geometry.bottom;
      return childElement;
    }
  }
}
