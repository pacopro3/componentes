import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoitem = 0;
  bool _isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/300/200?random=$imagen'),
          );
        },
      ),
    );
  }

  Future<void> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoitem++;
      _agregar10();
    });
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _listaNumeros.add(_ultimoitem++);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isloading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
    return Future.delayed(duration);
  }

  void respuestaHTTP() {
    _isloading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 300,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOutExpo,
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
