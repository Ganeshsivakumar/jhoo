import 'dart:async';
import 'package:jhoo/jhoo.dart';
import 'package:jhoo/src/elements/elementTree/tree.dart';

void main() {
  createPage(pageName: "Home Page", body: HomeElement());
}

class HomeElement extends StatefulElement {
  @override
  DomElement build() {
    return Container(children: [
      Text(id: "t1", text: "Stream Builder Test"),
      Text(id: "t2", text: "Num Stream"),
      StreamBuilder(
          stream: numStream(),
          builder: (connectionState, snapshot) {
            if (connectionState == ConnectionState.waiting) {
              return Text(id: "n1", text: "data is loading");
            } else if (connectionState == ConnectionState.active) {
              return Text(id: "n1", text: "value in stream $snapshot");
            }
            return Container(children: []);
          })
    ]);
  }
}

//A stream that yields numbers from 1 to 10
Stream<int> numStream() async* {
  for (int i = 0; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    // print(i);
    yield i;
  }
}
