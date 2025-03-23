from machine import Pin, Timer
import time

led = Pin(25, Pin.OUT)
timer = Timer()

while True:
    led.toggle()
    time.sleep(0.5) 
