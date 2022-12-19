/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_live/photos_model.dart';
import 'package:wallpaper_live/wallpaper_model.dart';
import 'detail_page.dart';

main() {
  runApp(My_App());
}

class My_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Anime_wallpaper(),
    );
  }
}

class Anime_wallpaper extends StatefulWidget {
  @override
  State<Anime_wallpaper> createState() => _Anime_wallpapertate();
}

class _Anime_wallpapertate extends State<Anime_wallpaper> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<Anime_model> Animewallpaper;
  @override
  void initState() {
    super.initState();
    Animewallpaper = getWallpaper('Anime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.only(left: 80),
        child: Text('Anime'),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            Text(
              'The Color Tone',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            FutureBuilder<Anime_model>(
                future: Animewallpaper,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder<Anime_model>(
                        future: Animewallpaper,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: snapshot.data!.arturl!
                                        .map(
                                          (photoData) => InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailPage(photoData
                                                              .src!.portrait)));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(start: 20, end: 4),
                                              child: Card(
                                                elevation: 20,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Image.network(
                                                        '${photoData.src!.portrait}',
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()));
                          } else if (snapshot.hasError) {
                            print('Error${snapshot.hasError}');
                          }
                          return CircularProgressIndicator();
                        });
                  } else if (snapshot.hasError) {
                    print('Error${snapshot.hasError}');
                  }
                  return CircularProgressIndicator();
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
          ],
        ),
      ),
    );
  }

  Future<Anime_model> getWallpaper(String mysearch) async {
    var myURL =
        "https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/premium?page=0&sensitivity=0&quality=$mysearch";
    List<Anime_model> arranime = [];
    var response =
        await http.get(Uri.parse(myURL), headers: {'Authorization': myKey});
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body);
      for (var wallpaper in list) {
        arranime.add(Anime_model.fromJson(list));
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext Context) {
            return AlertDialog(
              title: Text('Cant Fetch The API${response.statusCode}'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
            );
          });
    }
    return Anime_model();
  }
}

class Anime_model {
  int? artId;
  String? animename;
  String? arturl;
  int? sensitivity;

  Anime_model({this.artId, this.animename, this.arturl, this.sensitivity});

  Anime_model.fromJson(Map<String, dynamic> json) {
    artId = json['art_id'];
    animename = json['animename'];
    arturl = json['arturl'];
    sensitivity = json['sensitivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['art_id'] = this.artId;
    data['animename'] = this.animename;
    data['arturl'] = this.arturl;
    data['sensitivity'] = this.sensitivity;
    return data;
  }
}
*/
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anime_wallpaper(),
    );
  }
}

class Anime_wallpaper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Anime_wallpaperState();
}

class Anime_wallpaperState extends State<Anime_wallpaper> {
  var myURL =
      "https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/premium?page=1&sensitivity=0&quality=1";
  late Future<List<Anime_model>> arranime;

  @override
  void initState() {
    super.initState();
    arranime = getwallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anime"),
        ),
        body: Center(
          child: FutureBuilder<List<Anime_model>>(
            future: arranime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('Res: ${snapshot.data.toString()}');
                return ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data!),
                            ));
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(21),
                                  child: Container(
                                    child: Image.network(
                                        "${snapshot.data!}"),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: snapshot.data!.length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<List<Anime_model>> getwallpaper() async {
    var myURL =
        "https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/premium?page=1&sensitivity=0&quality=1";
    var response = await http.get(Uri.parse(myURL));
    var animes = <Anime_model>[];
    if (response.statusCode == 200) {
      var jsonData = JsonDecoder().convert(response.body);
      for(var Anime in jsonData)
      {
        Anime.add(Anime_model.fromJson(Anime));
      }
      return animes;
    }
    else {
      print("Could not fetch News due to ${response.statusCode}");
    }
  }
}*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Anime_api extends StatefulWidget {
  const Anime_api({Key? key}) : super(key: key);

  @override
  State<Anime_api> createState() => _Anime_apiState();
}

class _Anime_apiState extends State<Anime_api> {
  var myKey = "7b3097767cmshf0905eae8827426p101830jsnf6146c2a71db";
  late Future<List<Anime_model>> arrAnimeWall;

  @override
  void initState() {
    super.initState();
    arrAnimeWall = getAnimeWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Anime_model>>(
        future: arrAnimeWall,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(snapshot.data![index].arturl!),
                    ),
                  ],
                ),
                itemCount: snapshot.data!.length,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }

  Future<List<Anime_model>> getAnimeWallpaper() async {
    var myUrl =
        "https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/search";

    var data =
        await http.get(Uri.parse(myUrl), headers: {'X-RapidAPI-Key': myKey});
    print("data: ${data.toString()}");

    var AnimeWall = <Anime_model>[];
    if (data.statusCode == 200) {
      var jsondata = jsonDecode(data.body);
      print(jsondata.toString());

      for (var Anime in jsondata) {
        AnimeWall.add(Anime_model.fromJson(Anime));
      }
    } else {
      print("Response not Fetch");
    }
    return AnimeWall;
  }
}

class Anime_model {
  int? artId;
  String? animename;
  String? arturl;
  int? sensitivity;

  Anime_model({this.artId, this.animename, this.arturl, this.sensitivity});

  Anime_model.fromJson(Map<String, dynamic> json) {
    artId = json['art_id'];
    animename = json['animename'];
    arturl = json['arturl'];
    sensitivity = json['sensitivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['art_id'] = this.artId;
    data['animename'] = this.animename;
    data['arturl'] = this.arturl;
    data['sensitivity'] = this.sensitivity;
    return data;
  }
}

/*class Anime_model {
  int? artId;
  String? animename;
  String? arturl;
  int? sensitivity;

  Anime_model({this.artId, this.animename, this.arturl, this.sensitivity});

  Anime_model.fromJson(Map<String, dynamic> json) {
    artId = json['art_id'];
    animename = json['animename'];
    arturl = json['arturl'];
    sensitivity = json['sensitivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['art_id'] = this.artId;
    data['animename'] = this.animename;
    data['arturl'] = this.arturl;
    data['sensitivity'] = this.sensitivity;
    return data;
  }
}*/
