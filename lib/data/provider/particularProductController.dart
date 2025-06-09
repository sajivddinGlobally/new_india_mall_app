import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/particularProductModel.dart';

final particularProductsProvider =
    FutureProvider.family<ParticularProductModel, String>((ref, id) async {
      final particularProduct = ApiStateNetwork(await createDio());
      return particularProduct.particularProduct(id);
    });
