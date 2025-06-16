# Mechanical Design – `hardware/`

This directory contains the mechanical design files for the rover-mini project.
It includes 3D models, structural notes, and mechanical features essential for the rover's operation.

---

## Overview

The mechanical frame of the rover is designed to be **compact, lightweight, and structurally robust**.

- **Dimensions**: 330 mm (W) × 370 mm (L) × 400 mm (H)
- **Weight**: Approx. 5.0 kg
- The chassis is constructed using **laser-cut acrylic plates**, arranged in a **two-layer structure** to improve strength and rigidity.
- The design focuses on **maintainability** and **fabrication simplicity**, with minimal part count and tool requirements.

---

## CAD Files

All CAD models are located under `hardware/cad/`.

- Formats: `.f3d` (Fusion 360) and `.step`
- The entire assembly is included.
- Feel free to download, explore, and modify the design as you wish!

---

## 3D Printed Parts

All components that require 3D printing are stored in the `3D_Print/` subdirectory.

- Key parts include: wheel hubs, rocker gearboxes, motor mounts, and structural connectors
- Files are provided in `.stl` format and optimised for standard FDM printers
- Recommended materials:
  - **PLA**: inexpensive and easy to print
  - **ABS**: better thermal resistance and strength, but more difficult to print

> ⚠️ Please check printer tolerances carefully — especially for mated or interlocking parts like gear housings.

---

## Rocker Mechanism with Compact Miter Gearbox

The rover features a **rocker-style suspension system**, enhancing manoeuvrability and adaptability on rough terrain.

- A **custom-built gearbox with compact miter gears** connects the left and right rocker arms
- This design enables smooth, passive articulation and synchronised movement across uneven surfaces
- **Miter gears** were chosen for their **1:1 ratio** and ability to **redirect rotational motion by 90°**, making them ideal for space-limited assemblies
- The gearbox casing is 3D printed and positioned centrally within the chassis for optimal balance and accessibility

---
