part of 'internet_cubit.dart';

sealed class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

final class InternetInitial extends InternetState {}
final class InternetOnline extends InternetState {
  String Msg;
  InternetOnline({required this.Msg});
}
final class InternetOffline extends InternetState {
  String msg;
  InternetOffline({required this.msg});
}
