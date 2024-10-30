import 'package:firebaselogin/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import '../../config/helpers/get_validation_details.dart';

// Proveedor que extiende de change notifier para poder notificar cambios.
class UserDetailProvider extends ChangeNotifier {
  //Lista de usuarios.
  List<UserModel> listadoUsuarios = [];

  Future<void> obtenDetallesValidacion() async {
    // Recupera cadena que representa una lista de mapas.
    final respuesta = await GetValidationDetails().getValidationDetails();

    // Limpia listado por si acaso.
    listadoUsuarios.clear();

    List<UserModel> listado = userModelListFromJsonMap(respuesta);

    listadoUsuarios.addAll(listado);

    notifyListeners();
  }

// Metodo que valida el usuario y devuelve true o false segun autorizacion.
  bool usuarioAutorizado(String? usermail) {
    if (usermail == null) {
      return false;
    }

    for (UserModel user in listadoUsuarios) {
      if (user.email == usermail) {
        return true;
      }
    }
    return false;
  }
}
