import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Models/UserDto.dart';
import 'package:flutter_app/Providers/outstand_provider.dart';
import 'package:flutter_app/Providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Outstand extends StatefulWidget {
  @override
  _OutstandState createState() => _OutstandState();

}

class _OutstandState extends State<Outstand> {

  Icon searchicon = new Icon(Icons.search);

  late UserDto user;

  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  bool isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(isInit){
      GetOutstandData();

      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<OutstandProvider>(
        builder: (context, outstandProvider, child) {
          return Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: Text(
                      "Date",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                Expanded(
                    child: Text(
                      "Invoice No",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                Expanded(
                    child: Text(
                      "Sale Type",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                Expanded(
                    child: Text(
                      "Balance",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              ]),
              SizedBox(height:5),
              Expanded(

                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: outstandProvider.outstandList.map((x){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Text(
                              DateFormat('yyyy-MM-dd').format(x.date as DateTime),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                        Expanded(
                            child: Text(
                              x.docid ?? "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                        Expanded(
                            child: Text(
                              x.invoicetype.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                        Expanded(
                            child: Text(
                              x.amount.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                      ]),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height:5),
              Row(children: <Widget>[
                Expanded(
                  child: Text(
                    "Total",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                Expanded(
                  child: Text(
                    myFormat.format(outstandProvider.totalAmount),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ]),
            ],
          );
        },
      ),
    );
  }

  Future<void> GetOutstandData() async{

    user = Provider.of<UserProvider>(context,listen:false).user;

    Provider.of<OutstandProvider>(context,listen:false).GetOutstands(user.userid!.toInt());

  }
}



// Future pickDate(BuildContext context) async {
//   final initialDateRange = DateTimeRange(
//       start: DateTime.now(), end: DateTime.now().add(Duration(hours: 24 * 3)));
//   final newDateRange = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5));
//   if (newDateRange == null) return;
// }

