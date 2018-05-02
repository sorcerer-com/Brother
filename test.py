#!/usr/bin/env python
import subprocess, re
from threading import Timer
from datetime import datetime
import RPi.GPIO as GPIO

lastCheckTime = datetime.now()
pin = 8

def sunnyTomorrow():
	proc = subprocess.Popen(["curl", "-s", "http://wttr.in/Sofia?2QT&lang=en"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	i = 0
	while True:
		line = proc.stdout.readline()
		if line != '':
			if i == 19 and re.findall("sunny", line.rstrip().lower()) > 2:
				print line.rstrip()
				print re.findall("sunny", line.rstrip().lower())
				return True
		else:
			break
		i += 1
	return False


def timer():
	Timer(60, timer).start()
	if datetime.now().hour == 23 and (datetime.now() - lastCheckTime).hours > 0:
		lastCheckTime = datetime.now()
		if not sunnyTomorrow():
			GPIO.output(pin, GPIO.HIGH)
	if datetime.now().hour == 6:
		GPIO.output(pin, GPIO.LOW)
		
		
GPIO.setmode(GPIO.BCM)
GPIO.setup(pin, GPIO.OUT)
timer()