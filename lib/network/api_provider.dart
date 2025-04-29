// class ApiProvider{
//
//  getAllAssetsData() async {
//     var result = await _dioClient.get('/assets/all');
//     return result.fold(
//           (l) {
//         return Left(handleApiError(l));
//       },
//           (r) {
//         final result = AllAssetDataViewModel.fromJson(r.data);
//         return Right(result);
//       },
//     );
//   }
// }