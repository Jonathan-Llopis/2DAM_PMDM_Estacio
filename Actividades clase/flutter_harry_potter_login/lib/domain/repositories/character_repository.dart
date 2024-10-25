import 'package:dartz/dartz.dart';
import 'package:flutter_harry_potter_login/domain/entities/character.dart';

abstract class CharacterRepository {
 Future<Either<Exception, List<Character>>> getAllCharacters();
}