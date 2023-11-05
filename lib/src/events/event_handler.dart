import 'dart:async';
import 'dart:html';

class EventHandler {
  EventHandler();
  void updateElement(String elementId, dynamic data) {
    Element? element = findElementById(elementId);
    element.text = data;
  }

  dynamic read<T>(Stream stream) {
    dynamic event;
    stream.listen((event) {
      event = event;
    });
    return event;
  }

  void onPressed(String id) {}

  Element findElementById(String elementId) {
    Element? element = document.getElementById(elementId);
    if (element != null) {
      return element;
    } else {
      throw Exception("Element with ID '$elementId' not found.");
    }
  }

  StreamSubscription<int> updateElementStream(
      Stream<int> stream, String elementId) {
    return stream.listen((data) {
      updateElement(elementId, "$data");
    });
  }
}
