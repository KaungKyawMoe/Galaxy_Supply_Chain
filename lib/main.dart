import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/ApiClient.dart';
import 'package:get_it/get_it.dart';
import 'Providers/product_provider.dart';
import 'Repositories/product_repo.dart';
import 'Views/Outstand/outstand.dart';
import 'Views/Products/products.dart';
import 'Views/ShoppingCart/shoppingcart.dart';
import 'package:provider/provider.dart';

GetIt sl=GetIt.instance;

registerGetIt(){

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ProductRepo());

  sl.registerFactory(() => ProductProvider(productRepo: GetIt.instance()));
}

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  registerGetIt();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider(productRepo: GetIt.instance(), )),
        ],
        child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      home: HomePage(),
      initialRoute: '/',
      routes: {
        // '/userinfo': (context) => UserInfo(),
        // '/userdetails': (context) => UserDetails(user: ModalRoute.of(context)!.settings.arguments as UserDto,),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int countno = 0;

  var arrList = ["Apple","Orange"];

  int selectedIndex = 0;

  List<Widget> widgetList = [
    Products(),
    ShoppingCart(),
    Outstand(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body:widgetList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState((){
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Sale"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Outstand"
          ),
        ],
      ),
    );
  }
}