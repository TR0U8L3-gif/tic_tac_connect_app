import 'package:equatable/equatable.dart';

abstract class Figure extends Equatable {
  const Figure({
    this.symbol = '',
  });

  factory Figure.fromSymbol(String symbol) {
    switch (symbol) {
      case 'X':
        return const FigureCross();
      case 'O':
        return const FigureCircle();
      case 'S':
        return const FigureSquare();
      case 'T':
        return const FigureTriangle();
    }
    return FigureNone();
  }

  final String symbol;

  Figure clone() {
    switch (symbol) {
      case 'X':
        return const FigureCross();
      case 'O':
        return const FigureCircle();
      case 'S':
        return const FigureSquare();
      case 'T':
        return const FigureTriangle();
    }
    return FigureNone();
  }

  @override
  List<Object?> get props => [runtimeType, symbol];

}

class FigureCross extends Figure {
  const FigureCross() : super(symbol: 'X');
}

class FigureCircle extends Figure {
  const FigureCircle() : super(symbol: 'O');
}

class FigureSquare extends Figure {
  const FigureSquare() : super(symbol: 'S');
}

class FigureTriangle extends Figure {
  const FigureTriangle() : super(symbol: 'T');
}

class FigureNone extends Figure {}

class PlayableFigures {
  static List<Figure> figures = const [
    FigureCircle(),
    FigureCross(),
    FigureSquare(),
    FigureTriangle(),
  ];

  static Figure call(int index) {
    if (index >= figures.length || index < 0) {
      return FigureNone();
    }
    return figures[index];
  }
}
