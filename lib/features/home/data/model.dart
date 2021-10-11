

import 'package:shared_bills_manager/features/home/data/bill_types.dart';

class FlatObject {
  final String billType;
  final bool isPaid;
  final int flatNum;
  final String paidOn;

  FlatObject({this.billType = '', this.isPaid = false, this.flatNum = 0, this.paidOn = ''});
}

List<FlatObject> flatObjList = [
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 1,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 2,
    paidOn: '26 Jun, 02:25 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 3,
    paidOn: '26 Jun, 02:36 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 4,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 5,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 6,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 7,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    flatNum: 8,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 9,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 10,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 11,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 12,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 13,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 14,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 15,
    paidOn: '26 Jun, 02:26 pm'
  ),
  FlatObject(
    billType: billTypes.lawMa.toString(),
    isPaid: true,
    flatNum: 16,
    paidOn: '26 Jun, 02:26 pm'
  ),
];
