<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
 ## Features

Flutter package for getting subscribed topics in Firebase Cloud Messaging.

<!-- ## Features

TODO: List what your package can do. Maybe include images, gifs, or videos. -->

## Getting started

 
  FcmSubscribedTopcisServices subscribedTopcisServices =FcmSubscribedTopcisServices(jsonFile: );


## Usage

Passing the json file to the FcmSubscribedTopcisServices class.

```dart

FcmSubscribedTopcisServices subscribedTopcisServices =FcmSubscribedTopcisServices(jsonFile:<Services Account Json> );


final topcies = await subscribedTopcisServices.getSubscribeTopcis(<FCM_TOKEN>);

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
