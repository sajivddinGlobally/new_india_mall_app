import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/getAllproductsModel.dart';

final allProductProvider = FutureProvider<List<GetAllProductsModel>>((
  ref,
) async {
  final apiState = ApiStateNetwork(await createDio());
  return apiState.allProducts();
});
