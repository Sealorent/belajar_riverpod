import 'package:flutter/material.dart';

class DeferredRoute extends StatelessWidget {
  const DeferredRoute(this.future, this.buildChild);
  final Future<dynamic> Function() future;
  final Function() buildChild;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildChild();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}