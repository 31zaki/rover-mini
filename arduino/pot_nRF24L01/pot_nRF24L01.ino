#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

// Create RF24 object
RF24 radio(9, 8); // CE, CSN

const int potPin = A0; // ポテンショメータの接続ピン
int potValue = 0;      // ポテンショメータの値

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
  potValue = analogRead(potPin) / 4; // ポテンショメータの値を4分の1にする
  byte data = potValue; // 1バイトのデータとして送信

  radio.write(&data, sizeof(data)); // ポテンショメータの値を送信

  // シリアルモニタに値を表示
  Serial.print("Potentiometer value (original): ");
  Serial.print(potValue * 4);
  Serial.print(" -> Transmitted value: ");
  Serial.println(potValue);

  delay(5); // 0.005秒待つ
}
