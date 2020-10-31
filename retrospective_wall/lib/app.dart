import 'package:flutter/material.dart';
import 'screens/feedbacks/feedbacks.dart';
import 'screens/feedback_detail/feedback_detail.dart';
import 'style.dart';

const FeedbacksRoute = '/';
const FeedbackDetailRoute = '/feedback_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Locations(),
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case FeedbacksRoute:
          screen = Feedbacks();
          break;
        case FeedbackDetailRoute:
          screen = FeedbackDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          headline6: TitleTextStyle,
          bodyText2: Body1TextStyle, 
        )
      );
  }
}
