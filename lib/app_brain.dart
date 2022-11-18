import 'package:question_game/question.dart';

class AppBrain {
  int _questionNumber = 0;
  final List<Question> _questionGroup = [
    Question(
      q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      i: 'images/image-1.jpg',
      d: true,
    ),
    Question(q: 'القطط حيوانات تأكل اللحم', i: 'images/image-2.jpg', d: true),
    Question(
        q: 'الصين موجودة في قارة أفريقيا', i: 'images/image-3.jpg', d: false),
    Question(q: 'الأرض مسطحة وليست كروية', i: 'images/image-4.jpg', d: false),
    Question(
        q: 'بإستطاعة الانسان البقاء علي قيد الحياه بدون اكل اللحوم',
        i: 'images/image-5.jpg',
        d: true),
    Question(
        q: 'الشمس تدور حول الارض والارض تدور حول القمر',
        i: 'images/image-6.jpg',
        d: false),
    Question(q: 'الحيوانات لاتشعر بالالم', i: 'images/image-7.jpg', d: false),
  ];
  void nextQuestin() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinishe() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
