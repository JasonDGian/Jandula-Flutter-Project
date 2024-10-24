import 'package:flutter/material.dart';
import 'package:login_project/config/helpers/get_validation_details.dart';
import 'package:login_project/domain/models/user_model.dart';

// Proveedor que extiende de change notifier para poder notificar cambios.
class UserDetailProvider extends ChangeNotifier {
  //Lista vacia de usuarios para comprobacion inciala.
  List<UserModel> listadoUsuarios = [];

  Future<void> obtenDetallesValidacion() async {
    // Recupera cadena que representa una lista de mapas.
    final respuesta = await GetValidationDetails().getValidationDetails();
    // Limpia listado por si acaso.
    listadoUsuarios.clear();

    // Extrae un listado de usuarios del json recibido y lo cuelga al listado de usuarios limpio.
    List<UserModel> listaRecuperada = userModelFromJson(respuesta);

    // Añade la lista de elementos creada a la lista atributo del provider.
    listadoUsuarios.addAll(listaRecuperada);

    notifyListeners();
  }
}
