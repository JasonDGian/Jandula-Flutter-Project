import 'package:flutter/material.dart';
import 'package:login_project/config/helpers/get_validation_details.dart';
import 'package:login_project/domain/models/user_model.dart';

// Proveedor que extiende de change notifier para poder notificar cambios.
class UserDetailProvider extends ChangeNotifier {
// TODO: refactorizar.
//Lista vacia de usuarios para comprobacion inciala.

  List<UserModel> listadoUsuarios = [];

  Future<void> obtenDetallesValidacion() async {
    final respuesta = await GetValidationDetails().getValidationDetails();
    print("Listado es" + listadoUsuarios.toString());
    print("La respuesta obtenida es: " + respuesta);

    //listadoUsuarios = userModelFromJson(respuesta);
    //listadoUsuarios.add(UserModel.fromJson(respuesta));

    print("Listado es" + listadoUsuarios.toString());
  }
}
