import 'dart:ui';

// Пакеты
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Виджеты
import '../widgets/movie_tile.dart';

// модели
import '../model/search_category.dart';
import '../model/movie.dart';

// ref.watch использовать теперь
class MainPage extends ConsumerWidget {
  double? _deviceHeight;
  double? _deviceWidth;

  late TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _searchTextFieldController = TextEditingController();

    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
            _foregroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qPLNypNNU6x967DxZK85THNsf9K.jpg'),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight! * 0.02, 0, 0),
      width: _deviceWidth! * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceHeight! * 0.83,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
            child: _movieListViewWidget(),
          ),
        ],
      ),
    );
  }

  //
  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight! * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    //
    return Container(
      width: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) => {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: TextStyle(
              color: Colors.white24,
            ),
            hintText: 'Поиск фильма'),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    //
    return DropdownButton(
      dropdownColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      value: SearchCategory.none,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
      items: [
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
      ],
    );
  }

  Widget _movieListViewWidget() {
    final List<Movie> _movie = [];

    for (var i = 0; i < 20; i++) {
      _movie.add(
        Movie(
          name: "Бойцовский клуб",
          language: "Ru",
          isAdult: true,
          description: "Крутой Фильмец смотри не пожалеешь",
          posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
          backgroundPath: '/c6OLXfKAk5BKeR6broC8pYiCquX.jpg',
          rating: 7.5,
          releaseDate: '2021/07/16',
        ),
      );
    }

    if (_movie.length != 0) {
      return ListView.builder(
          itemCount: _movie.length,
          itemBuilder: (BuildContext _context, int _count) {
            //
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _deviceHeight! * 0.01, horizontal: 0),
              child: GestureDetector(
                onTap: () {},
                child: MovieTile(
                  movie: _movie[_count],
                  height: _deviceHeight! * 0.20,
                  width: _deviceWidth! * 0.85,
                ),
              ),
            );
          });
      //
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black54,
          color: Colors.white,
        ),
      );
    }
  }
}
