import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  NotFoundPage({ this.fid = '', Key? key}) : super(key: key);
  final String fid;

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VAppBar(context: context, title: getTranslated(context, 'not_found_page')),
      body: Container(
        child: Center(
          child: Text("Sorry, We couldn't found your page ${widget.fid}"),
        ),
      ),
    );
  }
}
