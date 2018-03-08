#!/usr/bin/python

# Import PySide classes
import sys
import subprocess
from PySide.QtCore import *
from PySide.QtGui import *


class App:
	def __init__(self):
		# Create a Qt application
		self.app = QApplication(sys.argv)
		icon = None
		status = None
		try:
			status = subprocess.check_output("lsmod")
			if status.find("nouveau") != -1:
				icon = QIcon("/usr/share/icons/Papirus/24x24@2x/panel/prime-intel.svg")
			else:
				icon = QIcon("/usr/share/icons/Papirus/24x24@2x/panel/prime-nvidia.svg")
		except Exception as e:
			#icon = QIcon("nvidia.svg")
			print(status)
		menu = QMenu()
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

if __name__ == "__main__":
	app = App()
app.run()
