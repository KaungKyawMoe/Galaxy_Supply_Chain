import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/OutstandDetailDto.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Models/UserDto.dart';
import '../../Providers/outstanddetail_provider.dart';
import '../../Providers/user_provider.dart';

class OutstandDetail extends StatefulWidget {

  int saletranid;
  OutstandDetail(this.saletranid);

  _OutstandDetailState createState() => _OutstandDetailState();
}

class _OutstandDetailState extends State<OutstandDetail> {

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

    if (isInit) {
      GetOutstandDetailData(widget.saletranid);

      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OutstandDetailProvider>(
      builder: (context, outstandDetailProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: outstandDetailProvider.outstanddetailList.length > 0 ?
            Text(outstandDetailProvider.outstanddetailList.first.docid.toString()) : SizedBox.shrink(),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
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
                        "Inv Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                  Expanded(
                      child: Text(
                        "Curr",
                        textAlign: TextAlign.center,
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
              ),
              SizedBox(height:7),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: outstandDetailProvider.outstanddetailList.map((x){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.1),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Card(
                          color: Color(0xccfafafa),
                          elevation: 0.3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                    x.invoicetype ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                              Expanded(
                                  child: Text(
                                    x.Curr.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                              Expanded(
                                  child: Text(
                                    myFormat.format(x.amount),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                            ]),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height:7),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
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
                      myFormat.format(outstandDetailProvider.totalAmount),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> GetOutstandDetailData(int saletranid) async {
    user = Provider
        .of<UserProvider>(context, listen: false)
        .user;

    Provider.of<OutstandDetailProvider>(context, listen: false)
        .GetOutstandsDetail(user.userid!.toInt(), saletranid);
  }
}
