import 'package:flutter/material.dart';
import 'package:retrospective_wall/style.dart';
import 'bubbles.dart';
import 'bubble_detail.dart';
import 'bubble_new.dart';

const BubblesRoute = '/';
const BubbleDetailRoute = '/bubble_detail';
const BubbleNewRoute = '/bubble_new';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case BubblesRoute:
          screen = Bubbles();
          break;
        case BubbleDetailRoute:
          screen = BubbleDetail(arguments['id']);
          break;
        case BubbleNewRoute:
          screen = BubbleNew();
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
