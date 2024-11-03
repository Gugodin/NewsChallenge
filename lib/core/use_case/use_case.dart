// Clase que nos servirá de molde para los diferentes casos de uso de nuestro feature
// Los casos de uso se manejarán como clase debido a que nos proporciona flexibilidad y mayor entendimiento al momento de implementar los casos de 
// en nuestra capa de presentación
abstract class UseCase <Type,Params>{
  Future<Type> call({Params params});
}