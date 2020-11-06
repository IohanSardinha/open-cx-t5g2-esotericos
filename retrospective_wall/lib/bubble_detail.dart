import 'package:flutter/material.dart';
import 'bubble.dart';
import 'text_section.dart';

class BubbleDetail extends StatelessWidget {
  final int _bubbleID;

  BubbleDetail(this._bubbleID);

  @override
  Widget build(BuildContext context) {
    final bubble = Bubble.fetchByID(_bubbleID);

    return Scaffold(
      appBar: AppBar(
        title: Text(bubble.text),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
        // []..add(Text(bubble.text)) ),
        []..add(textSections(bubble)) ),
    );
  }

  Widget textSections(Bubble bubble) {
    return TextSection(bubble.feedbackText.title, bubble.feedbackText.text);
  }
}