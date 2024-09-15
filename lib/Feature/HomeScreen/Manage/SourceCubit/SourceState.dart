
import '../../../../Models/source_model.dart';

abstract class SourceState {}

class LoadingSourceState extends SourceState {}

class SuccessSourceState extends SourceState {
 final List<Source> sourceList;
  SuccessSourceState(this.sourceList);
}
class FailureSourceState extends SourceState {
  final String errorMessage;

  FailureSourceState(this.errorMessage);
}
