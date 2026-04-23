import 'package:flutter_riverpod/legacy.dart';

StateNotifierProvider<SelectedDateNotefier, DateTime> selectedDateProvider =
    StateNotifierProvider<SelectedDateNotefier, DateTime>(
      (ref) => SelectedDateNotefier(),
    );

class SelectedDateNotefier extends StateNotifier<DateTime> {
  SelectedDateNotefier() : super(DateTime.now());

  void updateSelectedDate(DateTime newDate) {
    state = newDate;
  }
}
