import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_app/blocs/category_tab1_bloc.dart';
import 'package:wordpress_app/blocs/category_tab2_bloc.dart';
import 'package:wordpress_app/blocs/category_tab3_bloc.dart';
import 'package:wordpress_app/blocs/category_tab4_bloc.dart';
import 'package:wordpress_app/blocs/category_tab5_bloc.dart';
import 'package:wordpress_app/blocs/category_tab6_bloc.dart';
import 'package:wordpress_app/blocs/category_tab7_bloc.dart';
import 'package:wordpress_app/blocs/category_tab8_bloc.dart';
import 'package:wordpress_app/blocs/latest_articles_bloc.dart';
import 'package:wordpress_app/blocs/tab_index_bloc.dart';
import 'package:wordpress_app/config/wp_config.dart';
import 'package:wordpress_app/top_tabs/category_tab1.dart';
import 'package:wordpress_app/top_tabs/category_tab2.dart';
import 'package:wordpress_app/top_tabs/category_tab3.dart';
import 'package:wordpress_app/top_tabs/category_tab4.dart';
import 'package:wordpress_app/top_tabs/category_tab5.dart';
import 'package:wordpress_app/top_tabs/category_tab6.dart';
import 'package:wordpress_app/top_tabs/category_tab7.dart';
import 'package:wordpress_app/top_tabs/category_tab8.dart';
import 'package:wordpress_app/top_tabs/tab0.dart';

class TabMedium extends StatefulWidget {
  final ScrollController sc;
  final TabController tc;
  final GlobalKey<ScaffoldState> scaffoldKey;
  TabMedium(
      {Key? key, required this.sc, required this.tc, required this.scaffoldKey})
      : super(key: key);

  @override
  _TabMediumState createState() => _TabMediumState();
}

class _TabMediumState extends State<TabMedium> {
  @override
  void initState() {
    super.initState();
    this.widget.sc.addListener(_scrollListener);
  }

  void _scrollListener() async {
    final lb = context.read<LatestArticlesBloc>();
    final cb1 = context.read<CategoryTab1Bloc>();
    final cb2 = context.read<CategoryTab2Bloc>();
    final cb3 = context.read<CategoryTab3Bloc>();
    final cb4 = context.read<CategoryTab4Bloc>();
    final cb5 = context.read<CategoryTab5Bloc>();
    final cb6 = context.read<CategoryTab6Bloc>();
    final cb7 = context.read<CategoryTab7Bloc>();
    final cb8 = context.read<CategoryTab8Bloc>();
    final sb = context.read<TabIndexBloc>();
    var isEnd =
        this.widget.sc.offset >= this.widget.sc.position.maxScrollExtent &&
            !this.widget.sc.position.outOfRange;

    if (sb.tabIndex == 0) {
      if (lb.articles.isNotEmpty && isEnd) {
        debugPrint("reached the bottom -t0");
        lb.pageIncreament();
        lb.setLoading(true);
        await lb.fetchData().then((value) {
          lb.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 1) {
      if (isEnd) {
        debugPrint("reached the bottom -t1");
        cb1.pageIncreament();
        cb1.setLoading(true);
        await cb1
            .fetchData(WpConfig.selectedCategories['1'][0], mounted)
            .then((value) {
          cb1.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 2) {
      if (isEnd) {
        debugPrint("reached the bottom -t2");
        cb2.pageIncreament();
        cb2.setLoading(true);
        await cb2
            .fetchData(WpConfig.selectedCategories['2'][0], mounted)
            .then((value) {
          cb2.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 3) {
      if (isEnd) {
        debugPrint("reached the bottom -t3");
        cb3.pageIncreament();
        cb3.setLoading(true);
        await cb3
            .fetchData(WpConfig.selectedCategories['3'][0], mounted)
            .then((value) {
          cb3.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 4) {
      if (isEnd) {
        debugPrint("reached the bottom -t4");
        cb4.pageIncreament();
        cb4.setLoading(true);
        await cb4
            .fetchData(WpConfig.selectedCategories['4'][0], mounted)
            .then((value) {
          cb4.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 5) {
      if (isEnd) {
        debugPrint("reached the bottom -t5");
        cb5.pageIncreament();
        cb5.setLoading(true);
        await cb5
            .fetchData(WpConfig.selectedCategories['5'][0], mounted)
            .then((value) {
          cb5.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 6) {
      if (isEnd) {
        debugPrint("reached the bottom -t6");
        cb6.pageIncreament();
        cb6.setLoading(true);
        await cb6
            .fetchData(WpConfig.selectedCategories['6'][0], mounted)
            .then((value) {
          cb6.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 7) {
      if (isEnd) {
        debugPrint("reached the bottom -t7");
        cb7.pageIncreament();
        cb7.setLoading(true);
        await cb7
            .fetchData(WpConfig.selectedCategories['7'][0], mounted)
            .then((value) {
          cb7.setLoading(false);
        });
      }
    } else if (sb.tabIndex == 8) {
      if (isEnd) {
        debugPrint("reached the bottom -t8");
        cb8.pageIncreament();
        cb8.setLoading(true);
        await cb8
            .fetchData(WpConfig.selectedCategories['8'][0], mounted)
            .then((value) {
          cb8.setLoading(false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Tab0(
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab1(
          categoryId: WpConfig.selectedCategories['1'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab2(
          categoryId: WpConfig.selectedCategories['2'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab3(
          categoryId: WpConfig.selectedCategories['3'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab4(
          categoryId: WpConfig.selectedCategories['4'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab5(
          categoryId: WpConfig.selectedCategories['5'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab6(
          categoryId: WpConfig.selectedCategories['6'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab7(
          categoryId: WpConfig.selectedCategories['7'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
        CategoryTab8(
          categoryId: WpConfig.selectedCategories['8'][0],
          scaffoldKey: widget.scaffoldKey,
        ),
      ],
      controller: widget.tc,
    );
  }
}
