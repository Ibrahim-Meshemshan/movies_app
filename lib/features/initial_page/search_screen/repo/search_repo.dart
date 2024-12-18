import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/exception/failures.dart';

import '../../../../core/exception/handling_exception_manager.dart';
import '../data/data_source/search_data_source.dart';
import '../data/model/search_response_model.dart';

class SearchRepo with HandlingExceptionManager{
  Future<Either<Failure,SearchResponseModel>> getSearch(String?query) async {
    return await wrapHandling(
      tryCall: () async {
        final result = await SearchDataSource.getSearch(query);
        return Right(result);
      },
    );
  }
}