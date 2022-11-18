import 'package:flutter/material.dart';
import 'package:question_game/app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Widget> answerResult = [];
  int resultAnswer = 0;

  void checkAnswer(bool whatUserPicked) {
    setState(() {
      bool correctAnswer = appBrain.getQuestionAnswer();
      if (whatUserPicked == correctAnswer) {
        resultAnswer++;
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appBrain.isFinishe() == true) {
        Alert(
          context: context,
          title: "انتهت الاسئلة",
          desc: "لقد اجبت علي $resultAnswer اسئلة صحيحة من  7 ",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "اعادة الاسئلة",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        resultAnswer = 0;
      } else {
        appBrain.nextQuestin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        centerTitle: true,
        title: const Text(
          'Question Game',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: answerResult,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Image.asset(
                    appBrain.getQuestionImage(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    appBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'صح',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text(
                    'خطأ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
