abstract class UseCase<Input, Output> {
  Output execute(Input input);
}

abstract class FutureUsecase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract class StreamUsecase<Input, Output> {
  Stream<Output> execute(Input input);
}

class NoParams {
  const NoParams();
}
