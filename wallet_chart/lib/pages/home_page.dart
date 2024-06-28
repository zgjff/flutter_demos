import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
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
                  Row(
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
                          // shape: RoundedRectangleBorder(side: BorderSide(color: const Color(0xff02d39a).withOpacity(0.7)),),
                          child: Row(
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
                          )),
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
                          // shape: RoundedRectangleBorder(side: BorderSide(color: const Color(0xff02d39a).withOpacity(0.7)),),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.ac_unit,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              const Text('Transfer')
                                  .fontSize(16)
                                  .textColor(Colors.white),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
