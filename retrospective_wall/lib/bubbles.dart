import 'package:flutter/material.dart';
import 'app.dart';
import 'bubble.dart';

class Bubbles extends StatefulWidget {
  @override
  _Bubbles createState() => _Bubbles();
}

class _Bubbles extends State<Bubbles> {
  @override
  void addBubble(Bubble b) {
    allBubbles.add(b);
  }

  Widget build(BuildContext context) {
    final bubbles = Bubble.fetchAll();

    return Scaffold(
        appBar: AppBar(
          title: Text('FeedBack Bubbles'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _onNewBubblePress(context);
              },
              child: Text("New Bubble"),
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                height: 200,
                child: ListView(
                  children: bubbles
                      .map((bubble) => GestureDetector(
                            child: Text(bubble.text,
                                style: Theme.of(context).textTheme.bodyText2),
                            onTap: () => _onBubbleTap(context, bubble.id),
                          ))
                      .toList(),
                ),
              )
            ])
          ],
        )));
  }

  _onBubbleTap(BuildContext context, int bubbleID) {
    Navigator.pushNamed(context, BubbleDetailRoute,
        arguments: {'id': bubbleID});
  }

  _onNewBubblePress(BuildContext context) async {
    final result = await Navigator.pushNamed(context, BubbleNewRoute);

    if (result != null) {
      setState(() {
        addBubble(result);
      });
    }
  }
}
