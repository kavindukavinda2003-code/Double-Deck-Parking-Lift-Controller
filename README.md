# Double-Deck Parking Lift Controller (DDPLC)

A digital control system for a **double-deck parking lift**, developed for the **EES5326 – Digital Electronic Design** course at **The Open University of Sri Lanka**.

## 📌 Overview

The **Double-Deck Parking Lift Controller (DDPLC)** is designed to control vehicle storing and retrieval operations in a two-level parking system.

The system uses a **Finite State Machine (FSM)**, digital logic circuits, sensors, push buttons, limit switches, and relay-based control to manage the parking lift safely and automatically.

## ⚙️ Main Features

* Vehicle Store operation
* Vehicle Retrieve operation
* Two-deck selection
* Lift Up/Down control
* Deck occupancy detection
* Load detection
* Limit switch monitoring
* Emergency handling
* Safety Return operation
* Reset operation
* FSM-based control

## 🧩 System Modules

The project consists of the following main modules:
![Double-Deck Parking Lift Controller](kkkkk.png)

* **Input Interface**
* **Finite State Machine (FSM)**
* **Deck Selection**
* **Counter Logic**
* **Output Control Logic**
* **Safety Return**

## 🔄 Finite State Machine

The controller uses a **12-state Moore FSM** to control the parking lift operation.

The main states are:

1. Initial
2. Check Deck
3. Deck Store
4. Deck 1 Retrieve
5. Deck 2 Retrieve
6. Parking Full
7. Move Up
8. Move Down
9. Wait
10. Wait 1
11. Safety Return
12. Emergency

## 🛠️ Technologies Used

* **VHDL**
* **FPGA**
* **Anvyl FPGA Development Board**
* **Xilinx ISE**
* **Xilinx iSim**
* **Digital Logic Design**
* **Finite State Machines**
* **D Flip-Flops**
* **Sensors**
* **Limit Switches**
* **Relay Control**

## 💻 Implementation

The system was developed and tested through the following stages:

```text
Digital Logic Design
        ↓
FSM Design
        ↓
VHDL Implementation
        ↓
Xilinx iSim Simulation
        ↓
Debugging & Verification
        ↓
Anvyl FPGA Implementation
        ↓
Hardware Testing
```

A **clock divider** was also implemented to make the FSM state transitions observable during FPGA testing.

## 🧪 Testing

The system was tested for:

* Store operation
* Retrieve operation
* Deck selection
* Lift movement
* Emergency operation
* Reset operation
* Safety Return
* FSM state transitions
* Counter operation


## 🎓 Academic Information

**Course:** EES5326 – Digital Electronic Design
**Institution:** The Open University of Sri Lanka
**Project:** Digital Electronic Design Project
**Year:** 2026

## 👨‍💻 Author

**Kavindu Kavinda**

Computer Engineering Undergraduate
The Open University of Sri Lanka

## 📚 Learning Outcomes

This project provided practical experience in:

* Digital system design
* FSM design
* VHDL programming
* FPGA implementation
* Digital logic circuits
* Hardware testing
* Troubleshooting and debugging
* Sensor interfacing
* Digital control systems

## ⭐ Project Highlights

* 12-state Moore FSM
* VHDL-based digital controller
* FPGA implementation
* Automated parking and retrieval control
* Safety Return mechanism
* Emergency handling
* Sensor and limit-switch integration
* Simulation and hardware testing

---

**EES5326 – Digital Electronic Design | The Open University of Sri Lanka | 2026**
