import 'dart:html';
import 'package:jhoo/src/elements/dom_element.dart';
import 'package:jhoo/src/style/text_style.dart';
import 'package:jhoo/src/utils/alignment.dart';

///Implements [DomElement] to create a paragraph html element
///using `build()` method that returns the html 'p' element
class Text implements DomElement {
  String text;
  String id;
  TextStyle? style;
  Text({required this.id, required this.text});

  @override
  Element build() {
    ParagraphElement textElement = ParagraphElement();
    textElement.text = text;
    textElement.id = id;
    textElement.style.fontSize = style?.fontSize;
    textElement.style.fontWeight = style?.fontWeight;
    textElement.style.fontFamily = style?.fontFamily;
    textElement.style.color = style?.textColor;
    return textElement;
  }
}

class Container implements DomElement {
  List<DomElement> children;
  Container({required this.children});
  @override
  Element build() {
    DivElement divElement = DivElement();
    for (var element in children) {
      divElement.append(element.build());
    }
    return divElement;
  }
}

class Row implements DomElement {
  List<DomElement> children;
  String? crossAxisAlinment;
  String? mainAxisAlignment;
  Row({this.crossAxisAlinment, this.mainAxisAlignment, required this.children});

  @override
  Element build() {
    DivElement divElement = DivElement();
    divElement.style.display = 'flex';
    divElement.style.flexDirection = 'row';
    divElement.style.alignItems = crossAxisAlinment ?? CrossAxisAlignment.start;
    divElement.style.justifyContent =
        mainAxisAlignment ?? MainAxisAlignment.center;
    for (var element in children) {
      divElement.append(element.build());
    }
    return divElement;
  }
}

class Column implements DomElement {
  List<DomElement> children;
  Column({required this.children});

  @override
  Element build() {
    DivElement divElement = DivElement();
    divElement.style.display = 'flex';
    divElement.style.flexDirection = 'column';
    for (var element in children) {
      divElement.append(element.build());
    }
    return divElement;
  }
}

class Button implements DomElement {
  String? text;
  Function onPressed;
  String id;

  Button(this.text, {required this.onPressed, required this.id});
  @override
  Element build() {
    ButtonElement button = ButtonElement();
    button.text = text;
    button.id = id;
    button.onClick.listen((event) {
      onPressed();
    });
    return button;
  }
}
