"""
Debug script to identify button and axis indices of your controller.
Press buttons / move sticks to see their indices and values.
"""

import pygame

pygame.init()
pygame.joystick.init()

joy = pygame.joystick.Joystick(0)
joy.init()
print(f"Controller: {joy.get_name()}")
print(f"Buttons: {joy.get_numbuttons()}  Axes: {joy.get_numaxes()}")
print("-" * 40)
print("Press buttons or move sticks. Ctrl-C to quit.\n")

prev_buttons = [False] * joy.get_numbuttons()

try:
    while True:
        pygame.event.pump()

        # ボタン（押した瞬間だけ表示）
        for i in range(joy.get_numbuttons()):
            pressed = bool(joy.get_button(i))
            if pressed and not prev_buttons[i]:
                print(f"  Button [{i}] pressed")
            prev_buttons[i] = pressed

        # 軸（デッドゾーン外のみ表示）
        for i in range(joy.get_numaxes()):
            val = joy.get_axis(i)
            if abs(val) > 0.2:
                print(f"  Axis   [{i}] = {val:+.2f}")

        pygame.time.wait(50)

except KeyboardInterrupt:
    print("\nDone.")
    pygame.quit()
