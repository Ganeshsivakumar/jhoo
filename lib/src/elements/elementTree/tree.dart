import 'dart:html';
import 'package:jhoo/jhoo.dart';

///Element tree takes a list of [DomElement], renders the list using `build()` method
///to return a list of HTML ELEMENTS.
class ElementTree {
  List<DomElement> children;
  ElementTree({required this.children});

  Element build() {
    DivElement div = DivElement();

    for (var element in children) {
      div.append(element.build());
    }
    return div;
  }
}

///`createPage()` method is the entry point to building application
///Takes [StatefulElement] and `pageName` an argument, `element` contains a list of UI Elements, renders it
///and adds it to the `body` of the html document, which is `index.html`

void createPage({required String pageName, required StatefulElement body}) {
  final documentBody = document.body;
  documentBody?.children.clear();
  ElementTree tree = ElementTree(children: [body.build()]);
  document.title = pageName;
  documentBody?.append(tree.build());
}
