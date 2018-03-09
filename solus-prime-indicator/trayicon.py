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
			if 'nouveau' in str(check_output("lsmod")):
				icon = QIcon("/usr/share/icons/Papirus/24x24@2x/panel/prime-intel.svg")
			else:
				icon = QIcon("/usr/share/icons/Papirus/24x24@2x/panel/prime-nvidia.svg")
		except Exception as e:
			print(e)
		menu = QMenu()
		#Gpu-switch
		switchAction = menu.addAction("Gpu-Switch")
		switchAction.triggered.connect(self.switch)
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

	def switch(self):
		try:
			os.system('pkexec --user $(logname) /usr/bin/gpu-switch')
		except Exception as e:
			print(e)

if __name__ == "__main__":
	app = App()
app.run()