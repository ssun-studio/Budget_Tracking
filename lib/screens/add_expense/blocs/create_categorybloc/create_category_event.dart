part of 'create_category_bloc.dart';

sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}

class Createcategory extends CreateCategoryEvent {
  final Category category;

  const Createcategory(this.category);

  @override
  List<Object> get props => [category];

}