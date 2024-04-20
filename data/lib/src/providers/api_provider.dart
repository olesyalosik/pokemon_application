import 'package:data/data.dart';
import 'package:data/src/mappers/pokemon_details_mapper.dart';
import 'package:data/src/mappers/pokemon_list_mapper.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiProvider {
  final Client _dioCLient;
  final Box<dynamic> _listBox;
  final Box<dynamic> _detailsBox;

  ApiProvider({
    required Client dioClient,
  })  : _dioCLient = dioClient,
        _detailsBox = Hive.box("detailsBox"),
        _listBox = Hive.box("listBox");

  Future<PokemonList> getPokemonList(String url) async {
    dynamic res = _listBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _dioCLient.get(url);
      _listBox.put(url, response.data);
      return PokemonListMapper.fromJson(response.data);
    }
    return PokemonListMapper.fromJson(res);
  }

  Future<PokemonDetails> getPokemonDetails(String url) async {
    dynamic res = _detailsBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _dioCLient.get(url);
      _detailsBox.put(url, response.data);
      return PokemonDetailsMapper.fromJson(response.data);
    }
    return PokemonDetailsMapper.fromJson(res);
  }

  Future<PokemonList> initPokemonList() async {
    String url = 'https://pokeapi.co/api/v2/pokemon';
    dynamic res = _listBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _dioCLient.get(url);
      _listBox.put(url, response.data);
      return PokemonListMapper.fromJson(response.data);
    }
    return PokemonListMapper.fromJson(res);
  }
}
