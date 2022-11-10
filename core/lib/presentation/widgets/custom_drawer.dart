import 'package:flutter/material.dart';

import 'package:core/core.dart';

class CustomDrawer extends StatefulWidget {
  final String location;
  final Widget content;

  const CustomDrawer({
    Key? key,
    required this.location,
    required this.content,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double slide = 250.0 * _animationController.value;

            return Stack(
              children: [
                _buildDrawer(),
                Transform(
                  transform: Matrix4.identity()..translate(slide),
                  alignment: Alignment.centerLeft,
                  child: widget.content,
                ),
              ],
            );
          }),
    );
  }

  Widget _buildDrawer() {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/circle-g.png'),
          ),
          accountName: Text('Ditonton'),
          accountEmail: Text('ditonton@dicoding.com'),
        ),
        ListTile(
          leading: const Icon(Icons.movie),
          title: const Text('Movies'),
          onTap: () {
            if (widget.location != movieRoute) {
              Navigator.pushNamed(context, movieRoute);
              toggle();
            } else {
              toggle();
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.live_tv),
          title: const Text('TV Show'),
          onTap: () {
            if (widget.location != tvRoute) {
              Navigator.pushNamed(context, tvRoute);
              toggle();
            } else {
              toggle();
            }
          },
        ),
        ExpansionTile(
          title: const Text('Watchlist'),
          leading: const Icon(Icons.save_alt),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                if (widget.location != watchlistmovieRoute) {
                  Navigator.pushNamed(context, watchlistmovieRoute);
                  toggle();
                } else {
                  toggle();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('TV Shows'),
              onTap: () {
                if (widget.location != watchlistTVRoute) {
                  Navigator.pushNamed(context, watchlistTVRoute);
                  toggle();
                } else {
                  toggle();
                }
              },
            ),
          ],
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, aboutRoute);
            toggle();
          },
          leading: const Icon(Icons.info_outline),
          title: const Text('About'),
        ),
      ],
    );
  }
}
