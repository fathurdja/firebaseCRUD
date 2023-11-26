import "package:flutter/material.dart";

navigatorPush(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

navigatorPop(BuildContext context) {
  Navigator.pop(context);
}
