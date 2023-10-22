import '../models/card_details.dart';

class Routes {
  static const login = '/';
  static const home = '/home';
  static const register = '/register';
  static const cardDetails = '/cardDetails';
  static const settings = '/settings';
  static const todoList = '/todoList';
  static const adress = '/adress';
}

class Arguments {
  String email;
  Arguments(this.email);
}

class CardParams {
  CardDetailsModel cardDetails;
  CardParams(this.cardDetails);
}
