
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/product_provider.dart';
import 'package:provider/provider.dart';
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0,4,12,0),
      child: Container(
        margin: EdgeInsets.all(2),
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12
          ),
          borderRadius: BorderRadius.circular(6)
        ),
        child:GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'search ...',
                hintStyle: TextStyle(
                  color:Colors.grey,
                ),
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState((){
                      searchTextController.text = "";
                      Provider.of<ProductProvider>(context,listen:false).Search("");
                    });
                  },
                  icon:Icon(Icons.clear,color: Colors.grey),
                ),
              ),
              onSubmitted: (data){
                Provider.of<ProductProvider>(context,listen:false).Search(data);
              },
            ),
        )
      ),
    );
  }
}
