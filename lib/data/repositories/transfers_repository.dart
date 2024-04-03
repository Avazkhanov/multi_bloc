import 'package:multi_bloc/data/api_provider/api_provider.dart';
import 'package:multi_bloc/data/my_response.dart';

class TransferRepository {
  Future<MyResponse> getTransferInfo() async {
    return ApiProvider.getTranfers();
  }
}
