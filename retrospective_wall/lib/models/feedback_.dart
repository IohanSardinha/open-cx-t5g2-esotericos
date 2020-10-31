import 'feedback_fact.dart';

class Feedback_ {
  final int id;
  String name;
  String imagePath;
  final List<FeedbackFact> facts;

  Feedback_(this.id, this.name, this.imagePath, this.facts);

  static List<Feedback_> fetchAll() {
    return [
      Feedback_(1, 'Wifi sucks', 'assets/images/cloudsCity.jpg', [
        FeedbackFact('Summary',
          'idk'),
        FeedbackFact('How To Get There',
          'idk either')
      ]),
      Feedback_(2, 'No food', 'assets/images/dubaiCity.jpg', [
        FeedbackFact('Summary',
          'No food. Me no like.')
      ]),
    ];
  }

    static Feedback_ fetchByID(int feedbackID) {
    // fetch all locations, iterate them and when we find the location
    // with the ID we want, return it immediately
    List<Feedback_> feedbacks = Feedback_.fetchAll();
    for (var i = 0; i < feedbacks.length; i++) {
      if (feedbacks[i].id == feedbackID) {
        return feedbacks[i];
      }
    }
    return null;
  }
}