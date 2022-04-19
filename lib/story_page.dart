// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:story_game_app/story_brain.dart';

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  void changeStory(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              _buildChoiceButton(
                storyBrain.getChoiceOne(),
                Colors.red,
                () {
                  changeStory(1);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: _buildChoiceButton(
                  storyBrain.getChoicetwo(),
                  Colors.blue,
                  () {
                    changeStory(2);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildChoiceButton(
  String text,
  Color color,
  Function function,
) {
  return Expanded(
    flex: 2,
    child: TextButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
