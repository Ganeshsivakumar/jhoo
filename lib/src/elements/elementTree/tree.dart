import 'dart:html';
import 'package:jhoo/jhoo.dart';
import 'package:jhoo/src/events/event_handler.dart';

///Element tree takes a list of [DomElement], renders the list using `build()` method
///to return a list of HTML ELEMENTS.
class ElementTree {
  List<DomElement> body;
  ElementTree({required this.body});

  Element build() {
    DivElement div = DivElement();

    for (var element in body) {
      div.append(element.build());
    }
    return div;
  }
}

///App extends [ElementTree] to provide structure to the web app
///
///you can use App to provide the `body`, which is list UI elements
///that impelements [DomElement], this list is later rendered by `ElementTree`

class App extends ElementTree {
  App({required super.body});
}

class Page {
  final App app;
  String pageName;
  //final ElementState state;
  final EventHandler handler;

  Page({required this.pageName, required this.app})
      : //state = ElementState(tree: app),
        handler = EventHandler() {
    document.title = pageName;
    runApp(app);
  }
}

///`runApp()` method is the entry point to building application
///Takes [App] as an argument, `app` contains a list of UI Elements, renders it
///and adds it to the `body` of the html document, which is `index.html`

void runApp(App app) {
  final body = document.body;
  body?.children.clear();
  body?.append(app.build());
}
