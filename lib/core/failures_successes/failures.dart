// abstract class Failure {
//   final String message;

//   const Failure({this.message = 'Something went wrong'});
// }

// class NoDataFailure extends Failure {
//   const NoDataFailure({String message = 'No data failure'})
//       : super(message: message);
// }

// class ServerFailure extends Failure {
//   const ServerFailure({String message = 'Server failure'})
//       : super(message: message);
// }

// class NetworkFailure extends Failure {
//   const NetworkFailure({String message = 'Network failure'})
//       : super(message: message);
// }

abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class FetchFailure extends Failure {
  const FetchFailure({String? message}) : super(message: message);
}
