import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/cubits/transfer_cubit/transfer_state.dart';
import 'package:multi_bloc/data/models/transfer_model.dart';
import 'package:multi_bloc/data/my_response.dart';
import 'package:multi_bloc/data/repositories/transfers_repository.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit({required this.transferRepository})
      : super(TransferInitialState());
  final TransferRepository transferRepository;

  Future<void> getTransfers() async {
    emit(TransferLoadingState());
    MyResponse myResponse = await transferRepository.getTransferInfo();
    if (myResponse.error.isEmpty) {
      emit(TransferSuccessState(
          transfers: myResponse.data as List<TransferModel>));
    } else {
      emit(TransferFailureState(message: myResponse.error));
    }
  }
}
