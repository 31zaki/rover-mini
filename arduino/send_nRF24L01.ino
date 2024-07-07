#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <printf.h>

//counter
int i = 0;

//create RF24 object
RF24 radio(9, 8); // CE, CSN

void setup() {
  Serial.begin(9600);
  while (!Serial);

  radio.begin();
  radio.openWritingPipe(0xE8E8F0F0E1LL);
  radio.setChannel(0x77);
  radio.setPALevel(RF24_PA_MAX);
  radio.enableDynamicPayloads();
  radio.stopListening();
  Serial.println("Transmitter ok");
}

void loop() {
  String str = "Hello World: " + String(i++);
  int str_len = str.length() + 1;
  char text[str_len];
  str.toCharArray(text, str_len);

  radio.write(&text, sizeof(text));
  Serial.println(text);
  delay(1000);
}
