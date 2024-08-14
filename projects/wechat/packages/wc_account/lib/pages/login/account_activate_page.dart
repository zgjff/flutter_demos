import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_services/router/router_path.dart';

/// 登录注册启动页面
class AccountActivatePage extends StatelessWidget {
  const AccountActivatePage({super.key});

  void _gotoLogin(BuildContext context) {
    context.push(RouterPath.phoneLogin.fullPath);
  }

  void _gotoRegister(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    print('AccountActivatePage build');
    const double edgeSpace = 24;
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: edgeSpace),
        padding: const EdgeInsets.only(
            left: edgeSpace, right: edgeSpace, bottom: edgeSpace),
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/LaunchImage.png',
                package: 'wc_account'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _gotoLogin(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(1, 21, 29, 40)),
                    elevation: WidgetStateProperty.all(0),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text('登录')
                      .textColor(Colors.white)
                      .fontSize(18)
                      .fontWeight(FontWeight.bold),
                ),
              ),
              const SizedBox(width: edgeSpace),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _gotoRegister(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0xFF07C160)),
                    elevation: WidgetStateProperty.all(0),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text('注册')
                      .textColor(Colors.white)
                      .fontSize(18)
                      .fontWeight(FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
