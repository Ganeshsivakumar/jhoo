import 'package:jhoo/jhoo.dart';
import 'package:jhoo/src/elements/elementTree/tree.dart';

void main() {
  //homePage creates a 'p' html element with text Hello world with id 't1'
  final homePage = Page(
    pageName: "New page",
    app: App(body: [
      Row(children: [Text(id: "t1", text: "Hello world")])
    ]),
  );

  //A stream that yields numbers 1-10 with 2 second delay
  Stream<int> numStream() async* {
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      print(i);
      yield i;
    }
  }

  //homePage object provides access to it's handler, that you can use
  //to update an element. 'updateElementStream()' takes a stream and
  //element's id and updates element with value emitted by the stream.

  homePage.handler.updateElementStream(numStream(), "t1");
}
