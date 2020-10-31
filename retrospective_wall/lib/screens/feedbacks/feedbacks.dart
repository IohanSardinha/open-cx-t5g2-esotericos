import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/feedback_.dart';

class Feedbacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedbacks = Feedback_.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: ListView(
        children: feedbacks.map( (feedback) => GestureDetector(
          child: Container(
            child: Text(feedback.name),
          ),
          onTap: () => _onFeedbackTap(context, feedback.id),
          ))
          .toList(),
      )
    );
  }

  _onFeedbackTap(BuildContext context, int feedbackID) {
    Navigator.pushNamed(context, FeedbackDetailRoute, arguments: {'id': feedbackID} );
  }
}