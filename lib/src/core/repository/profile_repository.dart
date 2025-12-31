import 'package:silancar_bloc/src/core/model/profile_model.dart';
import 'package:silancar_bloc/src/core/network/api_endpoint.dart';
import 'package:silancar_bloc/src/core/network/dio_client.dart';

class ProfileRepository {
  Future<DataProfile> fetchProfile() async {
    final response = await DioClient.get(
      ApiEndpoints.profile,
      fromJson: (json) => ProfileModel.fromJson(json),
    );
    return response!.data;
  }
}
