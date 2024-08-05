//Clase abstracta no se puede instanciar
void main(){
  final windPlant = WindPlant(initialEnergy:100);
  final nuclearPlant = NuclearPlant();
  
  print('wind: ${chargePhone(windPlant)}');
  print('nuclear: ${chargePhone(nuclearPlant)}');
}

//funcion
double chargePhone(EnergyPlant plant){
  if(plant.energyLeft < 10){
    throw Exception('Not enough energy');
  }
  
  return plant.energyLeft -10;
}

//enumeración -> nuevo tipo de planta
enum PlantType {nuclear,wind,water}

abstract class EnergyPlant{
  double energyLeft;
  PlantType type; // nuclear , wind, water
  
  //constructor
  EnergyPlant({required this.energyLeft, required this.type});
  
  void consumeEnergy( double amount);
}
//Herencia
class WindPlant extends EnergyPlant{
  //constructor
  WindPlant({ required double initialEnergy }):
  //constructor del padre
  super(energyLeft : initialEnergy, type:PlantType.wind);
  
  @override
  void consumeEnergy( double amount){
    energyLeft -= amount;
  }
}

//Implementar
class NuclearPlant implements EnergyPlant{
  
}