import 'package:flutter/material.dart';
import 'package:shared_bills_manager/home/model.dart';
import 'package:shared_bills_manager/utils/colour.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int percentage = 20;

  Widget _buildStatus({String status = '', String count = '', Color color = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              SizedBox(width: 10),
              Text(
                status,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          Text(
            count,
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCircularIndicator({int percent = 0, double val = 0.001}) {
    return Container(
      height: 130,
      width: 130,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  gradient: SweepGradient(
                      stops: [(percent / 100) * val, 0.1],
                      colors: [AppColor.excluded, Colors.white]),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Center(
            child: Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: 0.8,
                      colors: [Colors.white, AppColor.bgColor])),
              child: Center(
                  child: Text(
                '$percent %',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        height: height,
        color: AppColor.bgColor,
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
                            percentage = percentage + 10;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: _selectedIndex == i ? AppColor.paid : null,
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 130,
              width: double.infinity,
              child: Row(
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(seconds: 2),
                    builder: (context, double _val, _child) {
                      return Container(
                          child: _buildStatusCircularIndicator(
                              percent: (percentage * _val).ceil(), val: _val));
                    },
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: Container(
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildStatus(status: 'Paid', count: '9', color: AppColor.paid),
                            SizedBox(
                              height: 5,
                            ),
                            _buildStatus(status: 'Not paid', count: '4', color: AppColor.owing),
                            SizedBox(
                              height: 5,
                            ),
                            _buildStatus(status: 'Excluded', count: '3', color: AppColor.excluded),
                          ],
                        )),
                  ),
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
                                          color: AppColor.paid,
                                          size: 18,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: AppColor.owing,
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
