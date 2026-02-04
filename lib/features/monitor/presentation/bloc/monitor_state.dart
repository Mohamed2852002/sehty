part of 'monitor_bloc.dart';

abstract class MonitorState extends Equatable {
  const MonitorState();  

  @override
  List<Object> get props => [];
}
class MonitorInitial extends MonitorState {}
