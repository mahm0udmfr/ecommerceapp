 class Faliurs {
  String errorMessage;
  Faliurs({required this.errorMessage});
}

class ServerFaliure extends Faliurs {
  ServerFaliure({required super.errorMessage});
}

class NetworkFaliure extends Faliurs {
  NetworkFaliure({required super.errorMessage});
}
