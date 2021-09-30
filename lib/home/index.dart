import 'package:flutter/material.dart';
import 'package:shared_bills_manager/home/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        height: height,
        color: Color.fromRGBO(31, 31, 31, 1),
        child: ListView.builder(
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
                          Icon(Icons.house, color: Color.fromRGBO(252, 204, 63, 1), size: 20,),
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
                                            color: Colors.white.withOpacity(0.7), fontSize: 12),
                                      )
                                    : Text(
                                        'Not paid',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(0.7), fontSize: 12),
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
    );
  }
}
