#!/usr/bin/python3
import pyautogui, pyperclip, time




def main():
    pyautogui.hotkey('ctrl', 'x')
    time.sleep(1)
    original = pyperclip.paste()
    new = original.upper()
    pyperclip.copy(new)
    pyautogui.hotkey('ctrl', 'v')
    with open("log.txt", "w") as f:
        f.write(original)
        f.write("\n\n")
        f.write(new)

if __name__ == '__main__':
    main()


# ma aspetta un attimo 