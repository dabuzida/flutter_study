import 'package:flutter/material.dart';

class MyValueKey extends StatefulWidget {
  const MyValueKey({super.key});

  @override
  State<MyValueKey> createState() => _MyValueKeyState();
}

class _MyValueKeyState extends State<MyValueKey> {
  bool emailField = true;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170.0,
                    height: 190.0,
                  ),
                ),
                Form(
                    child: Theme(
                        data: ThemeData(primaryColor: Colors.teal, inputDecorationTheme: const InputDecorationTheme(labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                        child: Container(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: <Widget>[
                              if (emailField)
                                const TextField(
                                  // key: ValueKey(1), // value key
                                  decoration: InputDecoration(labelText: 'Enter "dice"'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              // 동일한 stateful 위젯인 TextField를 이용하여 구현중
                              // 각 필드에 문자를 입력하면, state를 가지게 됨
                              // 이때, 한개를 삭제시키면, 사라지는 필드에 입력된 문자가
                              // 남아있는 필드에 남게됨. 플러터는 위젯의 타입으로 식별해서 같은 TextField니깐
                              // 구별을 못함
                              // 이를 문자 입력 등의 state를 보존하기 위한 value key를 사용하여 구분시킴
                              // key를 주석치고 실행시키면 차이를 알 수 있음
                              const TextField(
                                // key: ValueKey(2), // value key
                                decoration: InputDecoration(labelText: 'Enter Password'),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    minimumSize: const Size(150, 50),
                                  ),
                                  child: const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      emailField = !emailField;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )))
              ],
            ),
          ),
        );
      },
    );
  }
}
