import 'package:flutter/material.dart';
import 'package:scorer_uchenna/pages/tabs/live_matches_tab.dart';
import 'package:scorer_uchenna/pages/tabs/post_matches_tab.dart';
import 'package:scorer_uchenna/pages/tabs/new_matches_tab.dart';
import '../widgets/tab_indicator.dart';
import 'package:scorer_uchenna/widgets/side_menu_drawer.dart';

enum Tabb { liveMatch, newMatch, postMatch }

Tabb tabb = Tabb.liveMatch;

class SoccerHome extends StatefulWidget {

  String? token;
  SoccerHome({Key? key, this.token}) : super(key: key);

  @override
  State<SoccerHome> createState() => _SoccerHomeState();
}

class _SoccerHomeState extends State<SoccerHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController!.addListener(() {
      if (_tabController!.index == 0) {
        setState(() {
          tabb = Tabb.liveMatch;
        });
      } else if (_tabController!.index == 1) {
        setState(() {
          tabb = Tabb.newMatch;
        });
      } else if (_tabController!.index == 2) {
        setState(() {
          tabb = Tabb.postMatch;
        });
      }
    });
  }

  TabBar get _tabBar => TabBar(
      controller: _tabController,
      indicator: const OutlineIndicator(),
      indicatorColor: Colors.white,
      tabs: const [
        Tab(
          text: 'Live Matches',
        ),
        Tab(
          text: 'New Matches',
        ),
        Tab(
          text: 'Post Matches',
        )
      ]);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: SideMenuDrawer(token: widget.token,),
      appBar: AppBar(
        backgroundColor: const Color(0xE5002929),
        centerTitle: true,
        title: const Text('Home'),
        bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(
            color: const Color(0xFF008F8F),
            child: _tabBar,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [LiveMatches(), NewMatches(), PostMatches()],
      ),
    );
  }
}
