import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wallet_chart/pages/home_page/cubit/home_page_cubit.dart';

import 'transaction_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _appBarKey = GlobalKey();

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollViewDidScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _scrollController = null;
    super.dispose();
  }

  void _scrollViewDidScroll() {
    var cubit = _appBarKey.currentContext?.read<HomePageCubit>();
    if (cubit == null) {
      return;
    }
    if (_scrollController == null) {
      cubit.changeShowTitle(false);
      return;
    }
    bool showTitle = _scrollController!.offset > 40;
    cubit.changeShowTitle(showTitle);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: Scaffold(
        appBar: AppBar(
          key: _appBarKey,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Builder(builder: (_) {
            return BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return Text(state.title()).textColor(Colors.white);
              },
            );
          }),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Balance')
                        .fontSize(20)
                        .textColor(Colors.blueGrey.shade300),
                    const SizedBox(height: 16),
                    const Text('\$ 12,500.00')
                        .fontSize(40)
                        .textColor(Colors.white)
                        .fontWeight(FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 40),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color(0xff02d39a).withOpacity(0.7)),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                height: 35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.wallet,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text('Payment')
                                        .fontSize(16)
                                        .textColor(Colors.white),
                                  ],
                                ),
                              )).expanded(),
                          const SizedBox(width: 20),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context).scaffoldBackgroundColor),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              height: 35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.compare_arrows,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text('Transfer')
                                      .fontSize(16)
                                      .textColor(Colors.white),
                                ],
                              ),
                            ),
                          ).expanded(),
                        ],
                      ),
                    ),
                    [
                      const Text('Recent Transactions')
                          .fontSize(16)
                          .textColor(Colors.blueGrey.shade300)
                    ].toRow(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SliverPrototypeExtentList.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return const TransactionCard(
                      money: '\$12500.00', time: '12:00 PM');
                },
                prototypeItem: const TransactionCard(money: '', time: ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
