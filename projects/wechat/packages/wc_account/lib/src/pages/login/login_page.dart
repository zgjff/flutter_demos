import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_account/src/models/country_region_phone_code.dart';
import 'package:wc_services/wc_services.dart';

import 'blocs/login_blocs.dart';
import 'components/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _goRegionPhoneCode(BuildContext context) {
    context.push(RouterPath.chooseCountry.fullPath);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginWayBloc()),
        BlocProvider(create: (_) => CountryRegionBloc()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appbar(context),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 40),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('手机号登录')
                          .textStyle(Theme.of(context).textTheme.labelLarge!),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 50),
                ),
                SliverToBoxAdapter(
                  child: BlocSelector<CountryRegionBloc, CountryRegionState,
                          CountryRegionPhoneCode?>(
                      selector: (state) => state.chooseRegionCode,
                      builder: (context, state) {
                        return ChooseAndEnterMobile(
                          cityName: state?.chineseName,
                          phoneCode: state?.phoneCode,
                          onTapCity: () {
                            _goRegionPhoneCode(context);
                          },
                        );
                      }),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SafeArea(
                    minimum: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LoginPageBottom(
                          currentLoginStyleDesc: '上述手机号仅用于登录验证',
                          onTapLogin: () {},
                          onTapFindPwdLogin: () {},
                          onTapMoreLogin: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
    );
  }
}
