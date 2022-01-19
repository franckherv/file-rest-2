import 'package:dio/dio.dart';
import 'package:nan_news/constants/common_variable.dart';
import 'package:nan_news/models/news_model.dart';

class HttpGlobalDatasource {
  Dio dio = Dio(
    BaseOptions(baseUrl: CommonVariable.apiBaseUrl, headers: {
      "Accept": "application/json",
      "Authorization": 'Bearer ${CommonVariable.userTken}'
    }),
  );
  var token;

  Future<List<Source>> getArticles() async {
    try {
      Response response = await dio.get("?format=json");

      /* PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);
      */

      return (response.data["results"] as List)
          .map((x) => Source.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("###error user####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Source>> getCategory() async {
    try {
      Response response = await dio
          .get("http://nannews.herokuapp.com/api/category/?format=json");
      return (response.data as List)
          .map((x) => Source.fromJson(x))
          .toList();
    } catch (e) {
      throw Exception("-----------$e-------------");
    }
  }

  //Connexion
/* loginWithEmailDataSource({
    String email,
    String password,
    }) async {
    try {} catch (e) {}
    return dio.post('login', data: {
      "email": email,
      "password": password,
    }).then((response) {

      //return User.token(response.data);
      return Token.fromJson(response.data);
      //return "Succes";
    }).then((token) {

      CommonVariable.userTken = token.accessToken;

      return dio.get('me',
          options: Options(
              headers: {'Authorization': token.authorizationHeader}))
          .then((response) {
        var user = UserModel.fromJson(response.data["data"])..token = token;

          CommonVariable.localUserDatas = user;

        user.store();
        return user;
      });
    });
  } */

  /* Future logout() async {

    try {
      Response response = await dio.post("logout");

      return response.data;

    } catch (error, stacktrace) {
      print("###error logout####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  } */

  /* //Inscription Etape 1
  Future<UserModel> signupStep1WithEmailDataSource({
    String firstname,
    String lastname,
    String tel,
    String email,
    String password,
  }) async {

    try {

      Response response = await dio.post('signup-step1', data: {
        "firstname": firstname,
        "lastname": lastname,
        "tel": tel,
        "email": email,
        "password": password,
      });

      return UserModel.fromJson(response.data["data"]);

    } catch (error, stacktrace) {
      print("###error signupStep1WithEmailDataSource####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }*/

  // ====== ETAPE 2 ========

  /* signupStep2WithEmailDataSource({
    String name,
    int userId,
    String tel,
    String email,
    String senderName,
    String siteWeb,
    String userEmail,
    String password,
  }) async {
    try {} catch (e) {}
    return dio.post('signup-step2', data: {
      "name": name,
      "user_id": userId,
      "tel": tel,
      "email": email,
      "sender_name": senderName,
      "site_web": siteWeb,
      "user_mail": userEmail,
      "password": password,
    }).then((response) {
      //return User.token(response.data);
      return Token.fromJson(response.data);
      //return "Succes";
    }).then((token) {

      CommonVariable.userTken = token.accessToken;

      return dio
          .get('me',
          options: Options(
              headers: {'Authorization': token.authorizationHeader}))
          .then((response) {
        var user = UserModel.fromJson(response.data)..token = token;
        user.store();
        return user;
      });
    });
  } */

  /*Future<HomeRecapModel> getHomeRecapDatas() async {

    try {
      Response response = await dio.get("get-home-recap");
      //print("###response####${response.data['data']}###");
      return HomeRecapModel.fromJson(response.data['data']);

    } catch (error, stacktrace) {
      print("###error courant####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<SmsSentModel>> getSingleSmsSent({@required BuildContext context, @required int page}) async {

    try {
      Response response = await dio.get("get-single-sms-sent?page=${page}");

      PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);

      return (response.data['data']['data'] as List)
          .map((x) => SmsSentModel.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("###error sms-sent####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }*/

/*  PaginationModel formatPaginagtionDatas({var datas}){
    var result = {
      'next_page_url': datas['next_page_url'],
      'total': datas['total'],
      'last_page': datas['last_page'],
      'current_page': datas['current_page'],
    };
    return PaginationModel.fromJson(result);
  }
  */

}
