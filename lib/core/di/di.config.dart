// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i886;
import '../../data/reposatries/auth_reposatry_impl.dart' as _i642;
import '../../data/reposatries/home_reposatry_impl.dart' as _i509;
import '../../domain/reposatries/auth/auth_reposatry.dart' as _i345;
import '../../domain/reposatries/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i16;
import '../../domain/reposatries/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i559;
import '../../domain/reposatries/home/home_reposatry.dart' as _i292;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/Login/cubit/login_view_model.dart' as _i236;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/main/home_tab/cubit/home_tab_view_model.dart'
    as _i161;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i559.HomeRemoteDataSource>(() =>
        _i886.HomeRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i292.HomeReposatry>(() => _i509.HomeReposatryImpl(
        homeRemoteDataSource: gh<_i559.HomeRemoteDataSource>()));
    gh.factory<_i16.AuthRemoteDataSource>(() =>
        _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i345.AuthReposatry>(() => _i642.AuthReposatryImpl(
        authRemoteDataSource: gh<_i16.AuthRemoteDataSource>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(authReposatry: gh<_i345.AuthReposatry>()));
    gh.factory<_i479.RegisterUseCase>(
        () => _i479.RegisterUseCase(authReposatry: gh<_i345.AuthReposatry>()));
    gh.factory<_i236.LoginViewModel>(
        () => _i236.LoginViewModel(registerUseCase: gh<_i471.LoginUseCase>()));
    gh.factory<_i773.GetAllBrandsUseCase>(() =>
        _i773.GetAllBrandsUseCase(homeReposatry: gh<_i292.HomeReposatry>()));
    gh.factory<_i201.GetAllCategoriesUseCase>(() =>
        _i201.GetAllCategoriesUseCase(
            homeReposatry: gh<_i292.HomeReposatry>()));
    gh.factory<_i873.RegisterViewModel>(() =>
        _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()));
    gh.factory<_i161.HomeTabViewModel>(() => _i161.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i201.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
        ));
    return this;
  }
}
