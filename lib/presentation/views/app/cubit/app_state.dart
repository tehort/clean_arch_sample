part of 'app_cubit.dart';

enum PageStack { splash, login, home }
enum AuthenticationStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState({
    required this.pageStack,
  });

  final PageStack pageStack;

  AppState copyWith({
    PageStack? stack,
  }) {
    return AppState(
      pageStack: stack ?? pageStack,
    );
  }

  @override
  List<Object> get props => [pageStack];
}
