/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
 int firstSensor = 0;    // first analog sensor
int secondSensor = 0;   // second analog sensor
int thirdSensor = 0;    // digital sensor
int inByte = 0;         // incoming serial byte

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);     
    // start serial port at 9600 bps:
  Serial.begin(9600);
  pinMode(2, INPUT);   // digital sensor is on digital pin 2
  establishContact();  // send a byte to establish contact until receiver responds 
}

void loop() {
    if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read first analog input, divide by 4 to make the range 0-255:
  //  firstSensor = analogRead(A0)/4;
    // delay 10ms to let the ADC recover:
    delay(10);
    // read second analog input, divide by 4 to make the range 0-255:
   // secondSensor = analogRead(1)/4;    // read  switch, map it to 0 or 255L
        thirdSensor = map(digitalRead(2), 0, 1, 0, 255);  
    // send sensor values:
  
        Serial.print(inByte); 
        Serial.println("dfsdf:");               
  
        digitalWrite(13, HIGH);   // set the LED on
        delay(500);              // wait for a second
        digitalWrite(13, LOW);    // set the LED off
        delay(500);
              digitalWrite(13, HIGH);   // set the LED on
        delay(500);              // wait for a second
        digitalWrite(13, LOW);    // set the LED off
        delay(500);  
                digitalWrite(13, HIGH);   // set the LED on
        delay(500);              // wait for a second
        digitalWrite(13, LOW);    // set the LED off
        delay(500);
              digitalWrite(13, HIGH);   // set the LED on
        delay(500);              // wait for a second
        digitalWrite(13, LOW);    // set the LED off
        delay(500);  
  digitalWrite(13, LOW);    // set the LED off
  delay(5000);              // wait for a second
    }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
