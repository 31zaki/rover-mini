# rover mini
Welcome to rover-mini Repository!!

This is a self-initiated project designed to explore and learn the full spectrum of engineering from mechanical design and electronics to embedded systems and software development.

<details>
<summary><strong>NOTE for Reviewers and Users</strong></summary>

While I have experience developing hardware as part of a [student-led Mars rover team](https://www.instagram.com/ares_project_official/),
my academic background is originally in Biomedical Engineering.
Fields like robotics, software development, and PCB design are still outside my core expertise.
This project is part of my personal learning journey, and I’m fully aware that there may — or probably should — be mistakes or imperfections.
Any feedback or advice would be warmly appreciated.

Thank you!

</details>


## philosophy
**tiny, but mighty**
  - High performance in not enough; a heart must be woven into the design.
  - More than size — like "山椒は小粒でもぴりりと辛い"
  - Designed with Japanese craftsmanship — tiny in size, vast in spirit.


## features
**manual control**
  - Responsive remote operation using a PlayStation controller via Xbee and Bluetooth communication.
  - Essential for field testing and fine-tuning — offering an intuitive and playful driving experience.

**autonomous**
  - Core functionality designed for the University Rover Challenge Autonomous Mission.
  - Capable of navigating to specified GPS coordinates, detecting ARUCO markers, and identifying mission targets like bottles and hammers.
  - Striving toward true autonomy — small but strategic.

**collaboration with the main rover**
  - Built for intelligent mission sharing: coordinate with the main rover to divide tasks and maximize mission points.
  - Share positional and target information to enhance team efficiency and achieve greater success together.

## hardware overview

This mini rover is designed to be compact yet powerful, with a strong focus on functional performance, manufacturability, and aesthetic design.

<img width="1200" alt="{AB2F8BDA-105C-4608-8CE0-41E401231829}" src="https://github.com/user-attachments/assets/14d9cbe3-57db-4417-957f-fef1953c7620" />

### key features:
- High-torque 4WD system capable of navigating tough terrains.
- Rocker mechanism designed with compact miter gears, providing superior maneuverability and articulation.
- Simple and robust fabrication, combining 3D printed parts and laser-cut acrylic plates.
- Two-layer acrylic structure to enhance overall strength and rigidity.
- RealSense depth camera integrated for obstacle avoidance and spatial awareness, supporting advanced path planning.
- Design with a skeleton-like aesthetic, exposing parts of the structure for a visually engaging appearance.
- Soft rubber tyres for excellent traction and smooth handling across various surfaces.
- Dual-computer architecture:
  - Jetson Nano handles computationally intensive tasks like vision processing.
  - Raspberry Pi Pico 2W manages low-level motion control.

### specifications:
- Dimensions: 330 mm (W) × 370 mm (L) × 400 mm (H)
- Weight: 5 kg
- Maximum Speed: 10 m/s
- Power Source: Two 7.2V 4000mAh Ni-MH batteries
- 4-wheel drive system with custom 3D printed inner wheels and rubber tyres


## directory structure (今のところ)
```
```

## system components

| **category**         | **component**                        | **qty** | **details**                                   |
|----------------------|--------------------------------------|---------|-----------------------------------------------|
| **hardware**         | Main Computer                        | 1       | [Jetson Nano 4GB](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit)|
|                      | Sub Computer                         | 1       | [Raspberry Pi Pico 2 W](https://akizukidenshi.com/catalog/g/g130330/)|
|                      | Battery                              | 2       | [7.2V 4000mAh Ni-MH for Tamiya RC](https://www.amazon.co.jp/-/en/dp/B07789SDYY/?coliid=I2JRBFQTBLRCJF&colid=2I8FL97HRD1KQ&psc=1&ref_=list_c_wl_lv_ov_lig_dp_it) |
|                      | Drive Motor                          | 4       | [100:1 Metal Gearmotor 37Dx73L mm 12V with 64 CPR Encoder (Helical Pinion)](https://www.pololu.com/product/5167) |
|                      | Motor Driver                         | 4       | [TB67H450FNG](https://akizukidenshi.com/catalog/g/g114967/) |
|                      | Tyre                                 | 4       | [5.1 inch RC Crawler Tyre](https://www.amazon.co.jp/dp/B0D9VZH5C3?ref=ppx_yo2ov_dt_b_fed_asin_title)|
|                      | IMU (Inertial Measurement Unit)      | 1       |[BNO055](https://akizukidenshi.com/catalog/g/g116996/) |
|                      | Camera                               | 1       |[Realsense 435i](https://www.intelrealsense.com/depth-camera-d435i/) |
|                      | Indicator                            | 1       |[LED (RGB)](https://www.amazon.co.jp/dp/B09L82BP77?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) |
|                      | Communication Module                 | 2       |[Xbee](https://www.digi.com/resources/documentation/digidocs/pdfs/90002173.pdf) |
|                      | GPS Module                           | 1       |[Gravity GPS](https://wiki.dfrobot.com/SKU_TEL0157_Gravity_GNSS_Positioning_Module) |
|                      | Emergency Stop Button                | 1       |[KILIGEN 22mm 12-220V 5A](https://www.amazon.co.jp/dp/B0956SRHKC?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) |
|                      | Miter gear for Rocker Mechanism      | 4       |[M1S25*2310](https://jp.misumi-ec.com/vona2/detail/221000021851/?ProductCode=M1S25*2310)|
|                      | Bearings for Rocker Mechanism        | 6       |[SFL6700ZZ](https://jp.misumi-ec.com/vona2/detail/110302273720/?HissuCode=SFL6700ZZ&PNSearch=SFL6700ZZ&KWSearch=SFL6700ZZ&searchFlow=results2products&list=PageSearchResult)|
|                      | Rocker Shaft Holder                  | 2       |[SSTHIC10M](https://jp.misumi-ec.com/vona2/detail/110300011320/?PNSearch=SSTHIC10M&HissuCode=SSTHIC10M&Keyword=SSTHIC10M&list=SuggestPreview&searchFlow=suggest2products)|
|                      | Wheel Shaft Hub                      | 2       |[AO-8038](https://tamiyashop.jp/shop/g/g89877/)|
| **software**         | Operating System                     || Ubuntu 22.04                                  |
|                      | Programming Framework                || ROS 2 Humble                                    |
|                      | Control Algorithm                    || TBD                                           |
|                      | Communication Protocol               || Wireless communication with the main rover (Xbee) |
| **electronics**      | Please refer to `/Electronics/BOM/`  |||

## Jetson Nano GPIO configuration

| **GPIO pin number**  | **device name**                | **connection (pin or function)**  | **purpose**                     |
|---------------------:|--------------------------------|-----------------------------------|---------------------------------|
| 3 (I2C SDA)          | I2C Bus                        | SDA                               | I2C Data for GPS/BNO055         |
| 5 (I2C SCL)          | I2C Bus                        | SCL                               | I2C Clock for GPS/BNO055        |
| 7                    | LED1                           | LED_1                             | Indicator LED1 Control          |
| 11                   | LED2                           | LED_2                             | Indicator LED2 Control          |
| 13                   | LED3                           | LED_3                             | Indicator LED3 Control          |
| 8 (UART TX)          | Pico RX                        | JETSON_TX-PICO_RX                 | UART Communication              |
| 10 (UART RX)         | Pico TX                        | JETSON_RX-PICO_TX                 | UART Communication              |


## Raspberry Pi pico GPIO configration
| **GPIO pin number** | **device name**                 | **connection (pin or function)**  | **purpose**                     |
|---------------------:|--------------------------------|-----------------------------------|---------------------------------|
| GP0                  | Jetson Nano UART               | JETSON_RX-PICO_TX                 | UART Communication              |
| GP1                  | Jetson Nano UART               | JETSON_TX-PICO_RX                 | UART Communication              |
| GP2                  | Motor Driver LF                | LF_IN1                            | Motor control input             |
| GP3                  | Motor Driver LF                | LF_IN2                            | Motor control input             |
| GP4                  | Motor Driver RF                | RF_IN1                            | Motor control input             |
| GP5                  | Motor Driver RF                | RF_IN2                            | Motor control input             |
| GP6                  | Motor Driver LF                | LF_ENCODER_A                      | Encoder reading                 |
| GP7                  | Motor Driver LF                | LF_ENCODER_B                      | Encoder reading                 |
| GP8                  | Motor Driver RF                | RF_ENCODER_A                      | Encoder reading                 |
| GP9                  | Motor Driver RF                | RF_ENCODER_B                      | Encoder reading                 |
| GP10                 | Motor Driver LR                | LR_IN1                            | Motor control input             |
| GP11                 | Motor Driver LR                | LR_IN2                            | Motor control input             |
| GP12                 | Motor Driver LR                | LR_ENCODER_A                      | Encoder reading                 |
| GP13                 | Motor Driver LR                | LR_ENCODER_B                      | Encoder reading                 |
| GP14                 | Motor Driver RR                | RR_IN1                            | Motor control input             |
| GP15                 | Motor Driver RR                | RR_IN2                            | Motor control input             |
| GP16                 | Motor Driver RR                | RR_ENCODER_A                      | Encoder reading                 |
| GP17                 | Motor Driver RR                | RR_ENCODER_B                      | Encoder reading                 |

LF: Left Front<br>
RF: Right Front<br>
LR: Left Rear<br>
RR: Right Rear<br>

## install required python libraries


## miscellaneous

### project name
The project name "rover-mini" is inspired by the iconic British car [Mini](https://en.wikipedia.org/wiki/Mini). Like its namesake, this rover aims to be compact, functional, and adorable.
