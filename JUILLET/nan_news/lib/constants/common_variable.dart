 import 'package:intl/intl.dart';
import 'package:nan_news/models/news_model.dart';

class CommonVariable {

  static final apiBaseUrl = "https://nannews.herokuapp.com/api/article/";
  static final categoryUrl = "https://http://nannews.herokuapp.com/api/category/";
  static final serverImgUrl = "images/siteweb/show/";

  //static final sckApiBaseUrl = "https://dev.sycapay.net/api/"; //test
  static final sckApiBaseUrl = "https://dev.sycapay.com/"; //prod

  // static final GlobalKey<NavigatorState> navigatorKey =
  //     new GlobalKey<NavigatorState>();
  // static BuildContext get globalContext =>
  //     navigatorKey?.currentState?.overlay?.context;

  static String userTken;
  static String setglobalOneSignalPlayerId;
  //static ProductModel localUserDatas;

  static final ddMMYYFormat = new DateFormat('dd-MM-yyyy');
  static final hhMMFormat = new DateFormat('h:m');

}