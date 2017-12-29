# README #

A simple project demonstrating a pattern for decorating User Interface elements in a reusable, composable way using code or Interface Builder.

![N|Solid](https://github.com/KudoBop/IBDecorators/blob/master/Overview.jpg)

### Usage ###

* Create NSObject subclass
* Create IBOutlets to UI elements
* [IB - optional] Drag 'Object' from the right pane in IB, and set it's class
* [IB - optional] Connect compatible outlets
* Start decorating!

### Adventages ###

* Composition - many-to-many relation between UI elements and decorators
* Type safety - IB checks types in IBOutlets
* Usable from code and IB
* Reusability - decorator can be extracted to dedicated library and used within multiple Storyboards/XIBs
