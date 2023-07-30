import 'package:flutter/material.dart';
import 'Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Exam());
}

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 192, 192, 192),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text("اختبار ام القطاوه "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answer = [];
  List<Question> QIA = [
    Question("الامام من افضل الجامعات", 'Images/image-0.jpg', true),
    Question("القطط افضل شيء بالحياه", 'Images/image-1.jpg', true),
    Question("ضحى كوين الاي تي ", 'Images/image-2.jpg', true),
  ];
  int true1 = 0;
  int qnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answer,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(QIA[qnumber].image),
              const SizedBox(height: 20),
              Text(
                  textAlign: TextAlign.center,
                  QIA[qnumber].question,
                  style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: OutlinedButton(
              onPressed: () {
                bool correctanswer = QIA[qnumber].answer;
                if (correctanswer == true) {
                  true1++;
                  print("true answer");
                  answer.add(
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                  );
                } else {
                  print("wrong answer");
                }
                setState(() {
                  if (isfinished() == true) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: " انهيت جميع الاسئله ",
                      desc: " $true1 الاسئله الصحيحه ",
                      buttons: [
                        DialogButton(
                          child: Text(
                            " اعاده",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    reset();
                    answer = [];
                    true1 = 0;
                  } else {
                    qnumber++;
                  }
                });
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 10, color: Colors.green)),
              child: const Text(
                "صح",
                style: TextStyle(
                  color: Color.fromARGB(100, 54, 54, 54),
                  fontSize: 45,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                bool correctanswer = QIA[qnumber].answer;
                if (correctanswer == true) {
                  print("true answer");
                  answer.add(
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  print("wrong answer");
                }
                setState(() {
                  if (isfinished() == true) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: " انهيت جميع الاسئله ",
                      desc: "$true1عدد الاسئله الصحيحه ",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "اعاده",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    reset();
                    answer = [];
                    true1 = 0;
                  } else {
                    qnumber++;
                  }
                });
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 10, color: Colors.red)),
              child: const Text(
                "خطأ",
                style: TextStyle(
                  color: Color.fromARGB(100, 54, 54, 54),
                  fontSize: 45,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool isfinished() {
    if (qnumber >= 2) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    qnumber = 0;
  }
}
