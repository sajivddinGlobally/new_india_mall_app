import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/productByCategoryModel.dart';

final productByCateProvider = FutureProvider.family<List<ProductsByCategory>, String>(
  (ref, id) async {
    final productByCate = ApiStateNetwork(await createDio());
    return productByCate.fetchProductByCateg(id);
  },
);
