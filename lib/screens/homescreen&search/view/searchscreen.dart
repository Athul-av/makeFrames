import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/view/artist_profile2.dart';
import 'package:makeframes/screens/homescreen&search/provider/alluser_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Consumer<AllUserProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                child: CupertinoSearchTextField(
                  backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                  placeholder: 'search category or artist',
                  placeholderStyle: const TextStyle(
                  color: Color.fromARGB(255, 172, 172, 172), fontSize: 15),
                  itemColor: const Color.fromARGB(255, 180, 180, 180),
                  padding: const EdgeInsets.all(13),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (key) {
                    value.searchartist(key);
                  },
                ),
              ),
              Expanded(
                child: value.searchdata.isEmpty
                    ? Center(
                        child: boldtext('No Artists', Colors.white, 15), 
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: width(context, 0.37),
                                  mainAxisExtent: height(context, 0.225),
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 25, 25, 25),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    value.searchdata[index].dpimage != null
                                        ? CircleAvatar(
                                            radius: 36,
                                            backgroundImage: NetworkImage(value
                                                .searchdata[index].dpimage!))
                                        : const CircleAvatar(
                                            radius: 36,
                                            backgroundColor:
                                                Color.fromARGB(255, 25, 25, 25),
                                            foregroundColor: Color.fromARGB(
                                                255, 130, 130, 130),
                                            child: Icon(
                                              CupertinoIcons
                                                  .person_alt_circle_fill,
                                              size: 77,
                                            )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        value.searchdata[index].firstName!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Text(value.searchdata[index].domain!,
                                    style:const TextStyle(color:  Color.fromARGB( 255, 140, 140, 140), fontSize: 11),
                                    overflow: TextOverflow.ellipsis,), 
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    color1()),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)))),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ArtistProfileScreen2(
                                                        userdetails: value
                                                            .searchdata[index],artistid:value.searchdata[index].id 
                                                      )));
                                        },
                                        child: const Text(
                                          'Show profile',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 231, 231, 231)),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: value.searchdata.length,
                        ),
                      ),
              )
            ],
          );
        }));
  }
}
