import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_live/detail_page.dart';
import 'package:wallpaper_live/color.dart';
import 'package:wallpaper_live/photos_model.dart';
import 'package:wallpaper_live/wallpaper_model.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(My_App());
}

class My_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Travel_wallpaper(),
    );
  }
}

class Travel_wallpaper extends StatefulWidget {
  @override
  State<Travel_wallpaper> createState() => _Travel_wallpapertate();
}

class _Travel_wallpapertate extends State<Travel_wallpaper> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> Travelwallpaper;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    Travelwallpaper = getWallpaper('travel');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text('Travelling'),
        ),
      ),
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
                  suffixIcon: InkWell(
                      onTap: () {
                        Travelwallpaper =
                            getWallpaper(searchController.text.toString());
                        setState(() {});
                      },
                      child: Icon(Icons.search)),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.070),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => red_page()));
                    },
                    child: Hero(
                      tag: 'red',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => blue_page()));
                    },
                    child: Hero(
                      tag: 'blue',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => green_page()));
                    },
                    child: Hero(
                      tag: 'green',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pink_page()));
                    },
                    child: Hero(
                      tag: 'pink',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => purple_page()));
                    },
                    child: Hero(
                      tag: 'purple',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => greenAcc_page()));
                    },
                    child: Hero(
                      tag: 'greenaccent',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => cyan_page()));
                    },
                    child: Hero(
                      tag: 'cyan',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.027),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            FutureBuilder<WallpaperModel>(
                future: Travelwallpaper,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Wrap(
                        children: snapshot.data!.photos!
                            .map(
                              (photoData) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                              photoData.src!.portrait)));
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10, end: 10, top: 10, bottom: 10),
                                  child: Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Image.network(
                                            '${photoData.src!.portrait}',
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                            )
                            .toList());
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

  Future<WallpaperModel> getWallpaper(String mysearch) async {
    var myURL = "https://api.pexels.com/v1/search?query=$mysearch";
    var response =
        await http.get(Uri.parse(myURL), headers: {'Authorization': myKey});
    if (response.statusCode == 200) {
      var Travel_wallpaper = jsonDecode(response.body);
      return WallpaperModel.fromJson(Travel_wallpaper);
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
      return WallpaperModel();
    }
  }

  Future<PhotosModel> getPhotos() async {
    var URL = "https://api.pexels.com/v1/search?query=nature&per_page=30";
    var response =
        await http.get(Uri.parse(URL), headers: {'Authorization': myKey});
    if (response.statusCode == 200) {
      var photos = json.decode(response.body);
      return PhotosModel.fromJson(photos);
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
      return PhotosModel();
    }
  }
}
