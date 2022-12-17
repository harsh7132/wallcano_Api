import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
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
      home: red_page(),
    );
  }
}

class red_page extends StatefulWidget {
  @override
  State<red_page> createState() => _red_pageState();
}

class _red_pageState extends State<red_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('red');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Red'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
                  } else if (snapshot.hasError) {
                    print('Error${snapshot.hasError}');
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
          ],
        ),
      ),
    );
  }

  Future<WallpaperModel> getWallpaper(String mysearch) async {
    var myURL = "https://api.pexels.com/v1/search?query=redcolor";
    var response =
        await http.get(Uri.parse(myURL), headers: {'Authorization': myKey});
    if (response.statusCode == 200) {
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class blue_page extends StatefulWidget {
  @override
  State<blue_page> createState() => _blue_pageState();
}

class _blue_pageState extends State<blue_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('blue');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Blue'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class green_page extends StatefulWidget {
  @override
  State<green_page> createState() => _green_pageState();
}

class _green_pageState extends State<green_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('green');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Green'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class pink_page extends StatefulWidget {
  @override
  State<pink_page> createState() => _pink_pageState();
}

class _pink_pageState extends State<pink_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('pink');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Pink'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class purple_page extends StatefulWidget {
  @override
  State<purple_page> createState() => _purple_pageState();
}

class _purple_pageState extends State<purple_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('purple');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Purple'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class greenAcc_page extends StatefulWidget {
  @override
  State<greenAcc_page> createState() => _greenAcc_pageState();
}

class _greenAcc_pageState extends State<greenAcc_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('green accent');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Green Accent'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        color = getWallpaper(searchController.text.toString());
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
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10, end: 20, bottom: 20),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

class cyan_page extends StatefulWidget {
  @override
  State<cyan_page> createState() => _cyan_pageState();
}

class _cyan_pageState extends State<cyan_page> {
  var myKey = "563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController = TextEditingController();
  late Future<WallpaperModel> color;
  late Future<PhotosModel> photo;
  @override
  void initState() {
    super.initState();
    color = getWallpaper('cyan');
    photo = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text('Cyan'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                        color = getWallpaper(searchController.text.toString());
                        setState(() {});
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            FutureBuilder<WallpaperModel>(
                future: color,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
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
                                          start: 10,
                                          end: 10,
                                          top: 10,
                                          bottom: 10),
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
                                )
                                .toList()));
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
      var wallpapers = jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
          builder: (BuildContext context) {
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

/*
class Red extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red',style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: GridView.count(crossAxisCount: 3,mainAxisSpacing: 4.0,crossAxisSpacing: 3.0,children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child:Image.asset('assets/images/pexels-adonyi-gábor-1558916.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-artem-saranin-1547813.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-chevanon-photography-325044.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-engin-akyurt-1493226.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-lisa-fotios-1943232.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-pixabay-73873.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-pixabay-158826.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-scott-webb-532563.jpg',fit:BoxFit.cover)
          )
        ],),
      )
    );
  }
}

class Blue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'blue',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
        ),
      ),
    );
  }

}
class Green extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'green',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green,
        ),
      ),
    );
  }
}

class Pink extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'pink',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class Purple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'purple',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple,
        ),
      ),
    );
  }

}

class Black extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'black',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
      ),
    );
  }
}

class GreenAccent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'greenaccent',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

}
class Cyan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'cyan',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.cyan,
        ),
      ),
    );
  }

}*/
