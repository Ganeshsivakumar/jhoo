

Dart package to build dart web apps

## Features

Jhoo can help you create pure dart web apps with flutter like syntax

## Getting started

Start by importing the package
```
import 'package:jhoo/jhoo.dart';
import 'package:jhoo/src/elements/elementTree/tree.dart';
```

Use ```createPage()``` inside main method to create a new HTML page,
provide ```pageName``` and ```element``` to the createPage() method.

```void main() {
  createPage(pageName: "Home Page", body: HomeElement());
}```

pageName is the tile of the html document and body takes the dom element
that will be attached to the body of the html document.


You can create dom elements by extending ```StatefulElement```
and you can @override build() method to return DomElement.

Here, ```HomeElement``` creates 3 Text element, which is 3 'p' html element with their 
respective id and text.

```class HomeElement extends StatefulElement {
  @override
  DomElement build() {
    return Row(children: [
      Text(id: "t1", text: "Welcome to HomePage"),
      Text(id: "t2", text: "This is second element"),
      Text(id: "t3", text: "This is thrid Element")
    ]);
  }
}```


## Usage

`/example` contains a sample web app built with Jhoo package, it will demonstrate 
how you can dynamically update the UI using ```StreamBuilder``` from Jhoo.


## Additional information

Jhoo package is in it's early stages and not stable, it's under developement. Please feel to share your ideas and contribution.

run ```dart pub get``` to fix all errors after cloning the package