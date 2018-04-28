#!/usr/bin/python3
import sys
import subprocess

def reboot_please():
    print("Reboot your laptop to complete the switch!")

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print("You need to add argument install, remove, help or switch")
    elif len(sys.argv) >= 2:
        if sys.argv[1] == "install":
            print("Installing requirements for solus-prime-indicator")
            eopkg_pyqt5_install_return = subprocess.run(['sudo', 'eopkg', 'install', 'python-qtpy'], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(eopkg_pyqt5_install_return.stdout.decode('utf-8'))
            make_command_return = subprocess.run("cd solus-prime-indicator && make install", shell=True, stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(make_command_return.stdout.decode('utf-8'))
        elif sys.argv[1] == "remove":
            make_command_return = subprocess.run("cd solus-prime-indicator && make uninstall", shell=True, stdout=subprocess.PIPE, stdin=subprocess.PIPE)
            print(make_command_return.stdout.decode('utf-8'))
        elif sys.argv[1] == "help":
            print("- install\n\tAllows you to install solus-prime-indicator")
            print("- remove\n\tRemove solus-prime-indicator")
            print("- switch\t\n- intel \n\t\tAllow you to switch to your iGPU\n\t- nvidia\n\t\tAllow to switch to your dGPU")
        elif sys.argv[1] == "switch":
            if sys.argv[2] == "nvidia":
                result = subprocess.run(['sh', 'Setup.sh', 'rm'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
                print(result.stdout.decode('utf-8'))
                reboot_please()
            elif sys.argv[2] == 'intel':
                result = subprocess.run(['sh', 'Setup.sh' ], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
                print(result.stdout.decode('utf-8'))
                reboot_please()
            else :
                print("You only switch between Intel and Nvidia")
            