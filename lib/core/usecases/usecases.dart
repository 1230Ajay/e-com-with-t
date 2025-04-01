abstract class UseCases<Type,Params> {
  Future<Type> call({required Params params});
}