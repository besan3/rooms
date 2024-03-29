abstract class EndPoints{
  static const String baseUrl='https://rooms.doos.info/api/';
  static const String login='${baseUrl}users/login';
  static const String register='${baseUrl}users/register';
  static const String profile='${baseUrl}users/profile';
  static const String home='${baseUrl}home';
  static const String addRoom='${baseUrl}rooms/store';
  static const String rooms='${baseUrl}rooms/show?room_id=2';
}