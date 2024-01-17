import 'package:equatable/equatable.dart';

enum PageContentEnum {
  first,
  second,
  third,
  fourth,
}

class PageContent extends Equatable {
  const PageContent({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory PageContent.page({required PageContentEnum pagePosition}) {
    String? imageUrl;
    String title = 'title: ${pagePosition.name}';
    String description = 'description: ${pagePosition.name}';

    switch (pagePosition) {
      case PageContentEnum.first:
      // TODO(pagePosition): implement
      case PageContentEnum.second:
      // TODO(pagePosition): implement
      case PageContentEnum.third:
      // TODO(pagePosition): implement
      case PageContentEnum.fourth:
      // TODO(pagePosition): implement
    }

    return PageContent(
      imageUrl: imageUrl,
      title: title,
      description: description,
    );
  }

  final String? imageUrl;
  final String title;
  final String description;

  @override
  List<Object?> get props => [imageUrl, title, description];
}
