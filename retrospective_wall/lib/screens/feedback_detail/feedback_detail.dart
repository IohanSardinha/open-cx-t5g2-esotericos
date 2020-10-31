import 'package:flutter/material.dart';
import '../../models/feedback_.dart';
import 'image_banner.dart';
import 'text_section.dart';

class FeedbackDetail extends StatelessWidget {
  final int _feedbackID;

  FeedbackDetail(this._feedbackID);

  @override
  Widget build(BuildContext context) {
    final feedback = Feedback_.fetchByID(_feedbackID);

    return Scaffold(
      appBar: AppBar(
        title: Text(feedback.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner(feedback.imagePath),
        ]..addAll(textSections(feedback)) ),
    );
  }

  List<Widget> textSections(Feedback_ feedback) {
    return feedback.facts.map((fact) => TextSection(fact.title, fact.text)).toList();
  }
}