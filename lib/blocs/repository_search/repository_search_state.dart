import 'package:equatable/equatable.dart';

import '../../models/repository_model.dart';

abstract class RepositorySearchState extends Equatable {
  const RepositorySearchState();

  @override
  List<Object?> get props => [];
}

class RepositorySearchInitial extends RepositorySearchState {}

class RepositorySearchLoading extends RepositorySearchState {}

class RepositorySearchLoaded extends RepositorySearchState {
  final List<RepositoryModel> repositories;

  const RepositorySearchLoaded(this.repositories);

  @override
  List<Object?> get props => [repositories];
}

class RepositorySearchError extends RepositorySearchState {
  final String message;

  const RepositorySearchError(this.message);

  @override
  List<Object?> get props => [message];
}
