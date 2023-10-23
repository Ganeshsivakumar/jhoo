

Dart package to build dart web apps

## Features

Jhoo can help you create pure dart web apps with flutter like syntax

## Getting started

Start by importing the package
```
import 'package:jhoo/jhoo.dart';
import 'package:jhoo/src/elements/elementTree/tree.dart';
```

Create a ```Page()``` object that accepts an app.
App takes a list of UI elements and adds it to the body of the html document

This code creates div element in body of html document
and adds two 'p' html element with id "t1" and "t2" and their text
as div element's children. The div element and it's children is attached to the 
body of the html document.

```
  final mainPage = Page(
      pageName: "Main Page",
      app: App(body: [
        Row(children: [
          Text(id: "t1", text: "Element one"),
          Text(id: "t2", text: "Element two")
        ])
      ]));
```

## Usage

`/example` contains a sample web app built with Jhoo package


## Additional information

Jhoo package is in it's early stages and not stable, it's currently under developement. Open to ideas and contribution.
