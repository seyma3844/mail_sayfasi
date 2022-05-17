import 'package:flutter/material.dart';

class View extends StatefulWidget {
  @override
  State<View> createState() => _State();
}

class _State extends State<View> {
  List<Mail> _mailList = [
    Mail(
        'Ahmet',
        'Lorem ipsum is simply dummy text of the printing and typesetting industry...  ',
        '20 Mar',
        false,
        Colors.orange),
    Mail(
        'Mert',
        'Contary to popular bellef, Lorem Ipsum is not simply random text. It has roots...  ',
        '18 Haz',
        false,
        Colors.blue),
    Mail(
        'Murat',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla finib... ',
        '18 Haz',
        true,
        Colors.purple),
    Mail(
        'Turan',
        'Lorem ipsum dolar sit amet, consectetur adipiscing elit. Nulla finib...',
        '18 Haz',
        true,
        Colors.deepOrange),
    Mail(
        'Cemil',
        'Merhaba Umut nasilsin. Bir suredir gorusmuyoruz. Umarım iyisindir... ',
        '18 Haz',
        true,
        Colors.lightBlue),
    Mail(
        'Jack',
        'Hi umut! How you doing mate, call me when you ara available. ',
        '18 Haz',
        false,
        Colors.blueGrey),
    Mail('Daniel', 'Lorem ipsum is simply dummytext ', '18 Haz', false,
        Colors.pink),
    Mail('Sarah', 'Lorem ipsum is simply dummytext ', '18 Haz', false,
        Colors.yellow),
    Mail('Jordan', 'Lorem ipsum is simply dummytext ', '18 Haz', true,
        Colors.green),
    Mail('Dimitri', 'Lorem ipsum is simply dummytext ', '18 Haz', true,
        Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.menu),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        child: CircleAvatar(
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search in Mails',
                    contentPadding: EdgeInsets.all(13.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'PRIMARY',
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            width: size.width,
            height: size.height / 1.40,
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: _mailList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: size.width / 9,
                                child: CircleAvatar(
                                  backgroundColor: _mailList[index].color,
                                  child: Container(
                                      height: 20,
                                      child: Text(
                                        _mailList[index].title.substring(0, 1),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: size.width / 1.40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _mailList[index].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 30,
                                    child: Text(
                                      _mailList[index].icerik,
                                      style: TextStyle(fontSize: 13),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      (_mailList[index].tarih),
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        _mailList[index].favorite =
                                            !_mailList[index].favorite;
                                      },
                                    );
                                  },
                                  child: _mailList[index].favorite == true
                                      ? Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        )
                                      : Icon(Icons.star_border),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          onPressed: () {}),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.red),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Meeting',
          ),
        ],
        selectedItemColor: Colors.red,
      ),
    );
  }
}

class Mail {
  final String title;
  final String icerik;
  final String tarih;
  late bool favorite;
  final Color color;
  Mail(
    @required this.title,
    @required this.icerik,
    @required this.tarih,
    @required this.favorite,
    @required this.color,
  );
}
