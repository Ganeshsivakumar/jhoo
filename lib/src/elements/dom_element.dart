import 'dart:async';
import 'dart:html';
import 'package:jhoo/src/events/event_handler.dart';

///An abstract class to create html elements,
///contains build method that returns an HTML Element
abstract class DomElement {
  Element build();
}

///An abstract class to create tree of [DomElement]
abstract class StatefulElement {
  DomElement build();
}

abstract class AsyncBuilder implements DomElement {
  void updateState();
  void renderDomElement();
}

enum ConnectionState { waiting, active, done, error }

class StreamBuilder implements AsyncBuilder {
  EventHandler handler = EventHandler();
  Stream stream;
  DomElement Function(ConnectionState connectionState, dynamic snapshot)
      builder;
  dynamic snapshot;
  ConnectionState _state = ConnectionState.waiting;
  StreamBuilder({required this.stream, required this.builder}) {
    updateState();
  }

  @override
  void updateState() async {
    stream.listen((data) async {
      snapshot = data;
      _state = ConnectionState.active;
      renderDomElement();
    }, onDone: () {
      _state = ConnectionState.done;
    }, onError: (e) {
      _state = ConnectionState.error;
    });
  }

  @override
  void renderDomElement() {
    Element tempElement = build();
    String id = tempElement.id;
    Element element = handler.findElementById(id);
    Element newElement = build();
    element.innerHtml = newElement.innerHtml;
  }

  @override
  Element build() {
    return builder(_state, snapshot).build();
  }
}

/*
class FutureBuilder implements AsyncBuilder {
  @override
  void renderDomElement() {}

  @override
  void updateState() {}

  @override
  Element build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
*/
