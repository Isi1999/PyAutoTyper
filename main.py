import pyautogui
import time


def spam():
    print("Script starts in 10 seconds...")
    print("Move mouse to the TOP LEFT corner to abort immediately!")


    time.sleep(10)

    try:
        while True:
            x, y = pyautogui.position()
            if x == 0 and y == 0:
                print("Stopped by safety corner!")
                break

            # ___________________________________________________________
            # IMPORTANT: Enter the text the computer should type here
            # -----------------------------------------------------------
            pyautogui.write('Hi')
            #Here you can write other things

            #pyautogui.write('Shut up')

            # -----------------------------------------------------------
            # Specify the key to be pressed here (e.g., 'enter')
            # -----------------------------------------------------------
            pyautogui.press('enter')

            time.sleep(0.1)

    except KeyboardInterrupt:
        print("Stopped manually.")


if __name__ == "__main__":
    spam()