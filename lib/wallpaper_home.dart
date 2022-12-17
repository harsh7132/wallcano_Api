import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_live/detail_page.dart';
import 'package:wallpaper_live/color.dart';
import 'package:wallpaper_live/god_wallpaper.dart';
import 'package:wallpaper_live/photos_model.dart';
import 'package:wallpaper_live/travel_wallpaper.dart';
import 'package:wallpaper_live/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'anime_model.dart';
import 'music_wallpaper.dart';
import 'nature_wallpaper.dart';

main() {
  runApp(My_App());
}

class My_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Wallpapers(),
    );
  }
}

class Wallpapers extends StatefulWidget {
  @override
  State<Wallpapers> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpapers> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> wallpaper;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    wallpaper = getWallpaper('mahadev');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
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
                        wallpaper =
                            getWallpaper(searchController.text.toString());
                        setState(() {});
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            FutureBuilder<WallpaperModel>(
                future: wallpaper,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                          start: 20, end: 4),
                                      child: Card(
                                        elevation: 20,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                                .toList()));
                  } else if (snapshot.hasError) {
                    print('Error${snapshot.hasError}');
                  }
                  return CircularProgressIndicator();
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.070),
                Text(
                  'The Color Tone',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.036),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.070),
                Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0600),
                  Stack(children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nature_wallpaper()));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height * 0.2546,
                          width: MediaQuery.of(context).size.width * 0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                              'https://imgs.search.brave.com/5BAxi3tGY1u-TQ1FNLa0aXo46TMKgRfb4my-SKO5e_w/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDI1OTk1/OTQuanBn',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.350,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.0400,
                        width: MediaQuery.of(context).size.width * 0.469,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Colors.white10),
                        child: Center(
                          child: Text('𝐍𝐚𝐭𝐮𝐫𝐞',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0400),
                  Stack(children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => God_wallpaper()));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height * 0.2546,
                          width: MediaQuery.of(context).size.width * 0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                              'https://imgs.search.brave.com/q91DtzbQcga1dVpl5hZ39rCID7vitQ2ZxR5AjbSW0SE/rs:fit:990:1200:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS8tVWpOWUNReHlU/QmMvVXo3UmV6VXF1/NUkvQUFBQUFBQUFM/TGcvRDJxVE1ubWFz/R0EvczE2MDAvMDkx/LmpwZw',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.350,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => God_wallpaper()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.469,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.white10),
                          child: Center(
                            child: Text('𝐆𝐨𝐝',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0400),
                  Stack(children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Travel_wallpaper()));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height * 0.2546,
                          width: MediaQuery.of(context).size.width * 0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                              'https://imgs.search.brave.com/4x-QLtvIGQNNdXLvQAYnNxoJc9haTjnmv2DdQ5_e0qw/rs:fit:1200:1080:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDQwNjk0/NDEuanBn',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.350,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Travel_wallpaper()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.469,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.white10),
                          child: Center(
                            child: Text('𝐓𝐫𝐚𝐯𝐞𝐥',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0400),
                  Stack(children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Music_wallpaper()));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height * 0.2546,
                          width: MediaQuery.of(context).size.width * 0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                              'https://imgs.search.brave.com/hH8gGL9fX4NR7lsqpgCvFcF34fhjZkMqOcKym0FB8yw/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/dGhvdWdodGNvLmNv/bS90aG1iL2o3bzdW/Tlo4bW1Kd2hhMk0w/Rk82U3o5SDQ2dz0v/MTUwMHgxNTAwL2Zp/bHRlcnM6ZmlsbChh/dXRvLDEpL3BvcC1t/dXNpYy01N2JjZTM4/NjNkZjc4Yzg3NjM0/ZWE4MDYuanBn',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.350,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Music_wallpaper()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.469,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.white10),
                          child: Center(
                            child: Text('𝐌𝐮𝐬𝐢𝐜',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0300)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.070),
                Text(
                  'Crazy Visuals',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.0700),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0200),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.070),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    child: Stack(children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: MediaQuery.of(context).size.height * 0.2546,
                        width: MediaQuery.of(context).size.width * 0.464,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                            'https://imgs.search.brave.com/glQx4rJAwzmy2Xd3UygmnetFLsYeXlY6T9SoefsEoE0/rs:fit:1200:1200:1/g:ce/aHR0cDovL2Nkbi53/Y2NmdGVjaC5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTUv/MDMvR1RBLVYtNC5q/cGc',
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.350,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.469,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text('𝐆𝐚𝐦𝐢𝐧𝐠',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.040),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Anime_api()));
                    },
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      child: Stack(children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height * 0.2546,
                          width: MediaQuery.of(context).size.width * 0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                              'https://imgs.search.brave.com/GfnbYZ1DzUnKZ4e7T1aXtu9U-j0CXhGwnBXgzlTkZh0/rs:fit:1200:1200:1/g:ce/aHR0cDovL3d3dy5w/aXhlbHN0YWxrLm5l/dC93cC1jb250ZW50/L3VwbG9hZHMvMjAx/Ni8wMy9CYWNrZ3Jv/dW5kLW9uZS1waWVj/ZS13YWxscGFwZXIt/SEQtcnVmZnkuanBn',
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * 0.350,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0400,
                            width: MediaQuery.of(context).size.width * 0.469,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            child: Center(
                              child: Text('𝐀𝐧𝐢𝐦𝐞',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    child: Stack(children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: MediaQuery.of(context).size.height * 0.2546,
                        width: MediaQuery.of(context).size.width * 0.464,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                            'https://imgs.search.brave.com/Z45j6EZX_sThxw2W3Qz9RoyFnuE9lhCcaKFF1zXZAPw/rs:fit:1200:700:1/g:ce/aHR0cHM6Ly9zdGF0/aWMyLmNicmltYWdl/cy5jb20vd29yZHBy/ZXNzL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIwLzA4L25hcnV0/by1mZWF0dXJlZC5q/cGc',
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.360,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.469,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text('Live',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.0300)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0300)
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
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
    var URL = "https://api.pexels.com/v1/photos/2014422";
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
