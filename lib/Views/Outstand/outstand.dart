import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Outstand extends StatefulWidget {
  @override
  _OutstandState createState() => _OutstandState();

}

class _OutstandState extends State<Outstand> {
  Icon searchicon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          leading: SizedBox(),
          title: Transform(
            transform: Matrix4.translationValues(-25, 0, 0),
            child: Text(
              'OutStand LIst',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: searchicon,
              color: Colors.black,
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_view_month),
              color: Colors.black,
              onPressed: () {
                //pickDate(context);
                showDateRangePicker(
                    context: context,
                    firstDate:  DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 100)),
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 400.0,
                              maxHeight: 500.0,
                            ),
                            child: child,
                          )
                        ],
                      );
                    }

                );

              },
            ),
            IconButton(
              icon: Icon(Icons.local_print_shop_sharp),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: <Widget>[
          ListTile(
            tileColor: Color(0x66d3d3d3),
            title: Row(children: <Widget>[
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
          ),
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [

              ],
            ),
          ),
          ListTile(
            tileColor: Color(0x66d3d3d3),
            title: Row(children: <Widget>[
              Expanded(
                  child: Text(
                    "Total",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
            ]),
          ),

        ],
      ),
    );
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

