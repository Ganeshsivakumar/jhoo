import 'dart:async';
import 'dart:html';

class EventHandler {
  EventHandler();
  void updateElement(String elementId, dynamic data) {
    Element? element = findElementById(elementId);

    if (element != null) {
      element.text = data;
      print("element updated");
    } else {
      print("Element with ID '$elementId' not found.");
    }
  }

  Stream<dynamic> read<T>(Stream stream) {
    StreamController controller = StreamController();
    stream.listen((event) {
      controller.sink.add(event);
    });
    return controller.stream;
  }

  void onPressed(String id) {}

  Element? findElementById(String elementId) {
    Element? element = document.getElementById(elementId);
    return element;
  }

  StreamSubscription<int> updateElementStream(
      Stream<int> stream, String elementId) {
    return stream.listen((data) {
      updateElement(elementId, "$data");
    });
  }
}
