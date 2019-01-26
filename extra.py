#!/usr/bin/python3
import sys
import subprocess

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print("You need to add argument install, remove or help")
    elif len(sys.argv) >= 2:
        if sys.argv[1] == "install":
            print("Installing requirements for solus-prime-indicator")
            eopkg_pyqt5_install_return = subprocess.run(['sudo', 'eopkg', 'install', 'python3-qt5', 'make'], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(eopkg_pyqt5_install_return.stdout.decode('utf-8'))
            make_command_return = subprocess.run("cd solus-prime-indicator && make install", shell=True, stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(make_command_return.stdout.decode('utf-8'))

        elif sys.argv[1] == "remove":
            make_command_return = subprocess.run("cd solus-prime-indicator && make uninstall", shell=True, stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(make_command_return.stdout.decode('utf-8'))

        elif sys.argv[1] == "help":
            print("- install\n\tAllows you to install solus-prime-indicator")
            print("- remove\n\tRemove solus-prime-indicator")
            