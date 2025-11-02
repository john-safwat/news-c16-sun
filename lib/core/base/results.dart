sealed class Results<T> {
  T? data;

  Results(this.data);
}

class Loading<T> extends Results<T> {
  Loading() : super(null);
}

class Success<T> extends Results<T> {
  Success(super.data);
}

class Failure<T> extends Results<T> {
  String errorMessage;
  Exception exception;

  Failure(this.errorMessage, this.exception) : super(null);
}
