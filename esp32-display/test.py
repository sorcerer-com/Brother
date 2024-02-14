import serial, time
with serial.Serial('COM7', 115200, timeout=1) as ser:
	for i in range(0, 1000):
		print("send " + str(i))
		ser.write("image 0 0 800 600 background.bin\n".encode())
		time.sleep(0.1)
		#print(ser.readline())
		while ser.in_waiting > 0:
			print(ser.readline())
		print()