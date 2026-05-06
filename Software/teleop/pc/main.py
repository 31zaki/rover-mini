"""
rover-mini teleop PC-side entry point.

Flow:
  PS Controller (Bluetooth)
        ↓  pygame
  controller.py  →  RoverCommand
        ↓
  packet.py      →  5-byte binary packet
        ↓
  xbee_sender.py →  XBee serial  ~~~wireless~~~>  Jetson Nano
"""

import sys
import time
import argparse

from controller  import ControllerReader
from xbee_sender import XBeeSender, list_ports
from packet      import ButtonFlag


# ── Defaults ─────────────────────────────────────────────────────────────────
DEFAULT_PORT     = "/dev/ttyUSB0"   # change to COMx on Windows
DEFAULT_BAUDRATE = 115200
SEND_RATE_HZ     = 20               # packets per second
# ─────────────────────────────────────────────────────────────────────────────


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="rover-mini PC teleop")
    parser.add_argument("--port",     "-p", default=DEFAULT_PORT,
                        help=f"XBee serial port (default: {DEFAULT_PORT})")
    parser.add_argument("--baudrate", "-b", default=DEFAULT_BAUDRATE, type=int,
                        help=f"Baud rate (default: {DEFAULT_BAUDRATE})")
    parser.add_argument("--hz",             default=SEND_RATE_HZ, type=int,
                        help=f"Send rate in Hz (default: {SEND_RATE_HZ})")
    parser.add_argument("--list-ports",     action="store_true",
                        help="List available serial ports and exit")
    parser.add_argument("--dry-run",        action="store_true",
                        help="Run without XBee (print packets to stdout only)")
    return parser.parse_args()


def main():
    args = parse_args()

    # ── List ports and exit ───────────────────────────────────────────────
    if args.list_ports:
        ports = list_ports()
        print("Available serial ports:")
        for p in ports:
            print(f"  {p}")
        sys.exit(0)

    # ── Init controller ───────────────────────────────────────────────────
    try:
        ctrl = ControllerReader()
    except RuntimeError as e:
        print(f"[Error] {e}")
        sys.exit(1)

    # ── Init XBee sender ──────────────────────────────────────────────────
    sender = None
    if not args.dry_run:
        try:
            sender = XBeeSender(args.port, args.baudrate)
        except RuntimeError as e:
            print(f"[Error] {e}")
            ctrl.close()
            sys.exit(1)
    else:
        print("[DryRun] XBee not connected. Printing packets to stdout.")

    # ── Main loop ─────────────────────────────────────────────────────────
    interval = 1.0 / args.hz
    print(f"\n[Teleop] Running at {args.hz} Hz. Press OPTIONS to emergency-stop. Ctrl-C to quit.\n")

    try:
        while True:
            t_start = time.monotonic()

            cmd = ctrl.read()

            # QUIT event from pygame
            if cmd is None:
                print("\n[Teleop] Quit event received.")
                break

            # Emergency stop: print warning
            if ButtonFlag.EMERGENCY_STOP in cmd.buttons:
                print("[!!] EMERGENCY STOP")

            # Send
            if sender:
                sender.send(cmd)
            else:
                # dry-run: print encoded bytes + human-readable
                raw = cmd.encode()
                print(f"{str(cmd)}  |  {raw.hex(' ').upper()}")

            # Rate limiter
            elapsed = time.monotonic() - t_start
            sleep_time = interval - elapsed
            if sleep_time > 0:
                time.sleep(sleep_time)

    except KeyboardInterrupt:
        print("\n[Teleop] Interrupted.")

    finally:
        print(f"\n[Stats] {sender.stats if sender else 'dry-run'}")
        if sender:
            sender.close()
        ctrl.close()


if __name__ == "__main__":
    main()
