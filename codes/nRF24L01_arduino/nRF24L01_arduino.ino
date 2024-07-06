#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

#define CE_PIN   9
#define CSN_PIN 10

RF24 radio(CE_PIN, CSN_PIN);

const byte address[6] = "00001";

void setup() {
  Serial.begin(9600);
  while (!Serial) {}

  if (!radio.begin()) {
    Serial.println("Radio hardware not responding!");
    while (1) {}
  }

  Serial.println("Radio initialized.");
  radio.openWritingPipe(address);
  radio.openReadingPipe(1, address);
  radio.setPALevel(RF24_PA_LOW);
  radio.setDataRate(RF24_1MBPS);
  radio.setChannel(0x60);
  radio.startListening();  // Start in listening mode

  // Print details for debugging
  radio.printDetails();
}

void loop() {
  const char text[] = "Hello";

  // Sending
  Serial.print("Sending: ");
  Serial.println(text);
  radio.stopListening();
  bool report = radio.write(&text, sizeof(text));
  if (report) {
    Serial.println("Send successful");
  } else {
    Serial.println("Send failed");
  }

  // Switch to receive mode
  radio.startListening();
  delay(10);

  // Receiving
  if (radio.available()) {
    char receivedText[32] = {0};
    radio.read(&receivedText, sizeof(receivedText));
    Serial.print("Received: ");
    Serial.println(receivedText);
  } else {
    Serial.println("No data received");
  }

  delay(1000);
}
