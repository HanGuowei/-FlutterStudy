sealed class LoadUIState {}

class None implements LoadUIState {}

class Loading implements LoadUIState {}

class Error implements LoadUIState {
  Error(this.message);

  final String message;
}

class Success implements LoadUIState {
  Success(this.data);

  dynamic data;
}
