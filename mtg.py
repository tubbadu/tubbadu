#!/usr/bin/python3
import pyperclip


def main():
    s = pyperclip.paste()
    s2 = ''
    for line in s.split('\n'):
        line = line.split('$')[0].strip()
        s2 += line + '\n'
    pyperclip.copy(s2)

if __name__ == '__main__':
    main()
