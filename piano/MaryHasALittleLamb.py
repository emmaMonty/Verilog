import serial
import time

port = serial.Serial("/dev/ttyAMA0", baudrate=9600, timeout=3.0)

while True:
    port.write(b'0')
    time.sleep(1)
    
    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)
    
    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)
    
    port.write(b'40') #c4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.9)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.9)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.9)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)
    
    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)
    
    port.write(b'40') #c4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'44') #e4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'42') #d4
    time.sleep(0.4)
    port.write(b'0')
    time.sleep(0.1)

    port.write(b'40') #c4
    time.sleep(1.4)
    port.write(b'0')
    time.sleep(2)

