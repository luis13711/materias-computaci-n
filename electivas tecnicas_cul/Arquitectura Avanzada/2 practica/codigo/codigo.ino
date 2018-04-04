const int sensor = 0;
const int ledRojo = 5;
const int ledVerde = 6;
long miliVolts;
long temperatura;
int brillo;
void setup(){
  Serial.begin(9600);
  pinMode(ledRojo,OUTPUT);
  pinMode(ledVerde,OUTPUT);
}void loop(){
  miliVolts = analogRead(sensor)*5000L/1023;
  temperatura = miliVolts/10;
  brillo=map(temperatura,10,40,0,255);
  brillo = constrain(brillo,0,255);
  //frio valor brillo muy bajo
  analogWrite(ledRojo,brillo);
  analogWrite(ledVerde,255-brillo);
  
  Serial.print("Temperatura ");
  Serial.print(temperatura);
  Serial.println(" grados");
  delay(1000);
  /*
    int brillo=analogRead(pot);
  int brilloled = map(brillo, 0, 1023, 0, 255);//entrada 0 1023
  analogWrite(led,brilloled);
  */
}


