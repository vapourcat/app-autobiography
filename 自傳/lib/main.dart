import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的自傳'),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset('images/f1.jpg', width: 40, height: 40)
                  : Image.asset('images/f1.jpg', width: 20, height: 20),
              label: '自我介紹',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: '專業方向',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
              if (index == 0) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index == 1) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index == 2) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index == 3) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 = '        嗨，大家好！我出生於台南，在這片美麗的土地上度過了我充實而多彩的成長歲月。'
      '我的求學歷程：我在高雄科技大學攻讀資訊工程系，並深刻地受益於這段學術旅程。在學期間，我培養了不僅僅是學科知識，還有團隊協作和解難能力。'
      '畢業後，我計畫繼續攻讀研究所，讓我對於整個行業有了更全面的理解。'
      '除此之外，我還擁有豐富的興趣愛好。我熱愛排球，這讓我在繁忙的生活中找到了平衡和樂趣。此外，我也喜歡看電影，這擴展了我的視野並啟發了我的創造力。'
      '在生活的過程中，我學會了如何保持積極、樂觀，並對待每個挑戰。我相信每次努力都是一次學習的機會，而每個困難都是成長的契機。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'Who am I',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child: Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen2'),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學好英文'),
                    Text('2. 機器學習'),
                    Text('3. 考取證照'),
                    Text('4. 人際關係'),
                  ],
                ),
              ),
            ],
          ),
          Row(),
          Row(),
          Row(),
          Row(),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen4'),
      ),
    );
  }
}
