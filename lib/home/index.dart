import 'package:flutter/material.dart';
import 'package:shared_bills_manager/home/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        height: height,
        color: Color.fromRGBO(31, 31, 31, 1),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bills[_selectedIndex],
                    style:
                        TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white.withOpacity(0.8),
                  )
                ],
              ),
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bills.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: _selectedIndex == i ? Color.fromRGBO(48, 140, 106, 1) : null,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              bills[i],
                              style: TextStyle(color: Colors.white.withOpacity(0.7)),
                            )),
                      ),
                      SizedBox(width: 20)
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
                    height: 130,
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                    child: Center(child: Text('65%')),
                  ),
                  SizedBox(width: 20),
                  Container(height: 130,
                  child: Column(children: [
                    Text('adf', style: TextStyle(color: Colors.white),)
                  ],)
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: height - 320,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: flatObjList.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration:
                        BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.house,
                                  color: Colors.white.withOpacity(0.5),
                                  size: 20,
                                ),
                                SizedBox(width: 25),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Flat ${flatObjList[i].flatNum}',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(height: 3),
                                      flatObjList[i].isPaid
                                          ? Text(
                                              flatObjList[i].paidOn,
                                              style: TextStyle(
                                                  color: Colors.white.withOpacity(0.7),
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              'Not paid',
                                              style: TextStyle(
                                                  color: Colors.white.withOpacity(0.7),
                                                  fontSize: 12),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: flatObjList[i].isPaid
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 18,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red.withOpacity(0.7),
                                          size: 18,
                                        ),
                                ),
                                SizedBox(width: 15)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> bills = [
  'Lawma',
  'Nepa',
  'Cleaner',
  'Security',
  'Tech',
  'Gadget',
  'Vote',
  'idea',
  'Another',
  'Final',
  'Rent'
];
