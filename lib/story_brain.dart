// ignore_for_file: unused_field

import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;
  final List<Story> _storyData = [
    Story(
        storyTittle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choiceOne: 'I\'ll hop in. Thanks for the help!',
        choiceTwo: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTittle: 'He nods slowly, unphased by the question.',
        choiceOne: 'At least he\'s honest. I\'ll climb in.',
        choiceTwo: 'Wait, I know how to change a tire.'),
    Story(
        storyTittle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choiceOne: 'I love Elton John! Hand him the cassette tape.',
        choiceTwo: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTittle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choiceOne: 'Restart',
        choiceTwo: ''),
    Story(
        storyTittle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choiceOne: 'Restart',
        choiceTwo: ''),
    Story(
        storyTittle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choiceOne: 'Restart',
        choiceTwo: '')
  ];
  String getStory() {
    return _storyData[_storyNumber].storyTittle;
  }

  String getChoiceOne() {
    return _storyData[_storyNumber].choiceOne;
  }

  String getChoicetwo() {
    return _storyData[_storyNumber].choiceTwo;
  }

  void nextStory(int choiceNumb) {
    if (_storyNumber == 0 && choiceNumb == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 0 && choiceNumb == 2) {
      _storyNumber = 1;
    } else {
      if (_storyNumber == 1 && choiceNumb == 1) {
        _storyNumber = 2;
      } else if (_storyNumber == 1 && choiceNumb == 2) {
        _storyNumber = 3;
      } else {
        if (_storyNumber == 2 && choiceNumb == 1) {
          _storyNumber = 5;
        } else if (_storyNumber == 2 && choiceNumb == 2) {
          _storyNumber = 4;
        } else {
          if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
            restart();
          }
        }
      }
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
