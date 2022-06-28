import 'package:sharedlocal/formModel.dart';
import 'package:sharedlocal/service.dart';

class DataSource {
  Future<FormModel> getFormData() async {
    final result = await Service().getData();
    return FormModel.fromJson(result);
  }
}
