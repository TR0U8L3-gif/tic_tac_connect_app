import 'package:equatable/equatable.dart';

class Position extends Equatable {
  const Position({required this.x,required this.y});
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

}
