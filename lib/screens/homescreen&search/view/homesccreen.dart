import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/provider/alluser_provider.dart';
import 'package:makeframes/screens/homescreen&search/view/carouselitem.dart';
import 'package:makeframes/screens/homescreen&search/view/topartist_container.dart';
import 'package:makeframes/screens/homescreen&search/view/user_showbookings.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/view/artist_profile.dart';
import 'package:makeframes/screens/userprofile/view/normal_user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final providerSplash = Provider.of<SplashProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 3,
        title: Container(
          width: width(context, 0.4),
          height: height(context, 0.066),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Makeframes2.png'))),
        ),
        actions: [
          CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              radius: 19,
              child: IconButton(
                  onPressed: () {
                    if (providerSplash.artist == true) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ArtistProfileScreen()));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const NormalUserProfile()));
                    }
                  },
                  icon: const Icon(CupertinoIcons.person_alt_circle_fill))),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const UserStageBookings()));
                },
                icon: const Icon(CupertinoIcons.book_fill)),
          ),
        ],
      ),
      body: Consumer<AllUserProvider>(
        builder: (context, value, child) {
          return ListView(children: [
            CarouselSlider(
              items: [
                caroselitems2(
                    'assets/images/86b381580415673fd91936784a9cfd00.jpg',
                    context),
                caroselitems('assets/images/producer.jpg', context) 
              ],
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                autoPlayCurve: Curves.easeIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, top: 32, bottom: 7),
              child: Text(
                'Top Actors',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: SizedBox(
                  height: height(context, 0.2),
                  child: value.actors.isEmpty
                      ? Center(
                          child: boldtext('no actors', Colors.white, 14),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                TopArtistsContainer(
                                  name: value.actors[index].firstName!,
                                  dpimage: value.actors[index].dpimage,
                                  userdata: value.actors[index],
                                ),
                                const SizedBox(
                                  width: 7,
                                )
                              ],
                            );
                          }),
                          itemCount: value.actors.length > 5
                              ? 5
                              : value.actors.length)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, top: 18, bottom: 7),
              child: Text(
                'Top Directors',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: SizedBox(
                height: height(context, 0.2),
                child: value.directors.isEmpty
                    ? Center(
                        child: boldtext("no directors", Colors.white, 14),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              TopArtistsContainer(
                                  name: value.directors[index].firstName!,
                                  dpimage: value.directors[index].dpimage,
                                  userdata: value.directors[index]),
                              const SizedBox(
                                width: 7,
                              )
                            ],
                          );
                        }),
                        itemCount: value.directors.length > 5
                            ? 5
                            : value.directors.length),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, top: 18, bottom: 7),
              child: Text(
                'Top Actresses',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: height(context, 0.2),
                child: value.actress.isEmpty
                    ? Center(
                        child: boldtext("no actress", Colors.white, 14),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              TopArtistsContainer(
                                  name: value.actress[index].firstName!,
                                  dpimage: value.actress[index].dpimage,
                                  userdata: value.actress[index]),
                              const SizedBox(
                                width: 7,
                              )
                            ],
                          );
                        }),
                        itemCount: value.actress.length > 5
                            ? 5
                            : value.actress.length),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
