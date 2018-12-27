import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import '../UI/answer_button.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Makser is Human", false),
    new Question("Pizaa is Healthy", false),
    new Question("flutter is awesome",true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlaySholudBeVisible = false;

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlaySholudBeVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget> [
        new Column(
          children: <Widget>[ // This is our main page
            new AnswerButton(true,() => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false,() => handleAnswer(false))
          ],
        ),
        overlaySholudBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlaySholudBeVisible = false;
              questionText =currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container()
      ],
    );
  }
}