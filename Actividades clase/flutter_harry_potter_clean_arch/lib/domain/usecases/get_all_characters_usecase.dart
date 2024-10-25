import 'package:dartz/dartz.dart';
import 'package:flutter_harry_potter_clean_arch/domain/entities/character.dart';
import 'package:flutter_harry_potter_clean_arch/domain/repositories/character_repository.dart';


class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<Either<Exception, List<Character>>> call() async {
    return await repository.getAllCharacters();
  }
}