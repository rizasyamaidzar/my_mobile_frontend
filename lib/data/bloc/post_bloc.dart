import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:my_mobile_frontend/data/Model/post.dart';
import 'package:my_mobile_frontend/data/repository/api_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiRepository apiRepository;
  PostBloc({required this.apiRepository}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await apiRepository.getPostsList();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FailureLoadState(message: e.toString()));
        }
      } else {}
    });
  }
}
