// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post_model.dart';
import '../../../shared/network/remote/http_helper.dart';
import '../../feeds/cubit/states.dart';

class FeedsCubit extends Cubit<FeedsStates> {
  FeedsCubit() : super(FeedsInitialState());

  static FeedsCubit get(context) => BlocProvider.of(context);

}
