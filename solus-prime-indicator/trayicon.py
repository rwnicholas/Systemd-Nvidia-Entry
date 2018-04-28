#!/usr/bin/python3

import sys
import os
from PyQt5.QtWidgets import (QApplication, QSystemTrayIcon, QMenu)
from PyQt5.QtGui import QIcon
from subprocess import check_output, check_call

class App:
	def __init__(self):
		# Create a Qt application
		self.app = QApplication(sys.argv)
		icon = None
		try:
			if 'nvidia' in str(check_output("lsmod")):
				icon = QIcon.fromTheme("prime-nvidia")
			else:
				icon = QIcon.fromTheme("prime-intel")
		except Exception as e:
			print(e)
		menu = QMenu()
		#Gpu-switch
		#switchAction = menu.addAction("Gpu-Switch")
		#switchAction.triggered.connect(self.switch)
		#Exit
		exitAction = menu.addAction("Exit")
		exitAction.triggered.connect(sys.exit)

		self.tray = QSystemTrayIcon()
		self.tray.setIcon(icon)
		self.tray.setContextMenu(menu)
		self.tray.show()

	def run(self):
		# Enter Qt application main loop
		self.app.exec_()
		sys.exit()

	# def switch(self):
	# 	try:
	# 		getUser = os.getenv('USER')
	# 		status = str(check_output(["pkexec", "/usr/bin/gpu-switch", getUser]))
	# 		status = status.replace("'", "")
	# 		status = status[:-2]
	# 		status = status[1:]

	# 		if status == "nouveau":
	# 			check_call(['notify-send', '-i', 'dialog-information', 'Nouveau, please reboot!'])
	# 		elif status == "nouveau!":
	# 			check_call(['notify-send', '-i', 'dialog-information', 'Already Nouveau, please reboot!'])
	# 		elif status == "nvidia":
	# 			check_call(['notify-send', '-i', 'nvidia', 'Nvidia, please reboot!'])
	# 		elif status == "nvidia!":
	# 			check_call(['notify-send', '-i', 'nvidia', 'Already Nvidia, please reboot!'])
	# 		check_call(["gnome-session-quit", "--reboot"])
	# 	except Exception as e:
	# 		print(e)

if __name__ == "__main__":
	app = App()
app.run()
