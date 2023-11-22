import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currencycard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          //화면이 넘쳐흐를뜨 스크롤할 수 있게 만들어주는 widget임. 아래를 먼저 만들고 덮어주면 됨.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, //total balance의 column의 수평축을 시작위치로 바꿔줌.
              children: [
                const SizedBox(
                  height: 80,
                ), //마지막에 콤마를 잊지말자, 왜냐하면 이건 여전히 List 이니까
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Kwanghoon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white
                                .withOpacity(0.5), //색상의 투명도를 설정해줄 수 있음
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  //Total balance와 밑에 달러 표시 사이를 띄워주기 위한 공간
                  height: 10,
                ),
                const Text(
                  '\$5 194 482', //Dart 에서 Text 안에 변수를 넣을 때 '$' 문자를 사용해야함. 또한 변수가 아니라고 생각하게 해주기 위해서\ 표시를 해줘야함.
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: //Transfer와 Request가 너무 양쪽으로 벌어져있어서 양쪽 여백을 주기 위해 padding을 넣음.
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, //두 버튼을 서로 떨어뜨려줌.
                      children: [
                        //여기서부터 transfer 라는 박스를 만들기위한 작업
                        const Button(
                            //button 은 내가 만든 widget임.
                            text: 'Transfer',
                            bgColor: Colors.amber,
                            textColor: Colors.black),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 85, 85, 85),
                            borderRadius: BorderRadius.circular(45),
                          ), //boxdecoration widget을 필요로함.
                          // 이렇게만 써줘도 되지만 여백을 주기위해 padding안에 삽입, child: Text('Transfer'),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 50,
                            ),
                            child: Text(
                              'Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //Row는 main과 cross축이 있다. main 축은 가로축 cross축은 세로축
                  //col에서 main 은 세로축이고, cross축은 가로축이다.
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            0.8), //withOpacity(0.1), 하니까 범위안의 숫자가 아니라고 뜨는데 Row의 const를 지우면 해결됨.
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 429',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  offsetvalue: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 879',
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                  offsetvalue: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '9 879',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  offsetvalue: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
