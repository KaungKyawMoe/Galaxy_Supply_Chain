import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'Providers/product_provider.dart';
import 'Providers/shoppingcart_provider.dart';
import 'Providers/user_provider.dart';
import 'Repositories/product_repo.dart';
import 'package:provider/provider.dart';

import 'Repositories/user_repo.dart';
import 'Views/Users/login.dart';

GetIt sl=GetIt.instance;

registerGetIt(){

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ProductRepo());
  sl.registerLazySingleton(() => UserRepo());

  sl.registerFactory(() => ProductProvider(productRepo: GetIt.instance()));
  sl.registerFactory(() => UserProvider(userRepo: GetIt.instance()));
  sl.registerFactory(() => ShoppingCartProvider());
}

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  registerGetIt();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
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
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: Login(),
      initialRoute: '/',
      routes: {
        // '/userinfo': (context) => UserInfo(),
        // '/userdetails': (context) => UserDetails(user: ModalRoute.of(context)!.settings.arguments as UserDto,),
      },
    );
  }
}

