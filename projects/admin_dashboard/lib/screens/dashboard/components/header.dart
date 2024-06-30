import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/controllers/MenuAppController.dart';
import 'package:admin_dashboard/generated/assets.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: context.read<MenuAppController>().controlMenu,
            icon: const Icon(Icons.menu),
          ),
        if (Responsive.isDesktop(context))
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (Responsive.isMobile(context)) const SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        const Expanded(child: SearchField()),
        const ProfileCard(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          // why: 不然,点击的时候有突出的矩形
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin:
                const EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(Assets.iconsSearch),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding * 0.5),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10)),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesProfilePic,
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text('Angeline Joli'),
            ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
