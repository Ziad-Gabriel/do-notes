import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<PriorityIndexNotifier,int> priorityProvider=StateNotifierProvider<PriorityIndexNotifier,int>((ref)=>PriorityIndexNotifier());

class PriorityIndexNotifier extends StateNotifier<int> {
  PriorityIndexNotifier():super(1);

  void setPriority (int newIndex){
    state=newIndex;
  }
}