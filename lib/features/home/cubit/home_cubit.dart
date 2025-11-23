import 'package:bloc/bloc.dart';
import 'package:hungry/features/home/data/home_model.dart';
import 'package:hungry/features/home/data/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitial());

  HomeRepository repository = HomeRepository();


  Future<void> fetchProducts() async {
    emit(HomeLoading());
    try {
      final result = await repository.getHomeProducts();
      emit(HomeSuccess(data: result));
    } catch (e) {
      emit(HomeFailure(error: e.toString()));
    }
  }
}