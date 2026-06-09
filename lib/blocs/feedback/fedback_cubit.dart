import 'package:flutter_bloc/flutter_bloc.dart';
import 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(const FeedbackState());

  void updateUserDetails({
    required String name,
    required String email,
    required String contact,
  }) {
    emit(
      state.copyWith(
        name: name,
        email: email,
        contact: contact,
      ),
    );
  }

  void updateBugDescription({
    required String issueTitle,
    required String description,
  }) {
    emit(
      state.copyWith(
        issueTitle: issueTitle,
        description: description,
      ),
    );
  }

  void updateMedia({
    String? imagePath,
    String? videoPath,
    String? filePath,
  }) {
    emit(
      state.copyWith(
        imagePath: imagePath,
        videoPath: videoPath,
        filePath: filePath,
      ),
    );
  }
}