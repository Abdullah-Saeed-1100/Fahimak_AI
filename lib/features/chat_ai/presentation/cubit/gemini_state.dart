import 'package:equatable/equatable.dart';

sealed class GeminiStatus extends Equatable {
  const GeminiStatus();

  @override
  List<Object?> get props => [];
}

class GeminiInitial extends GeminiStatus {
  const GeminiInitial();
}

class GeminiLoading extends GeminiStatus {
  const GeminiLoading();
}

class GeminiSuccess extends GeminiStatus {
  const GeminiSuccess();
}

class GeminiFailure extends GeminiStatus {
  final String errMessage;
  const GeminiFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
