#!/usr/bin/env python
import requests
import tkinter as tk
from datetime import datetime

def trackEth():
    url= "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC,USD,EUR,GBP,ETH,SGD"
    response = requests.get(url).json()
    price = response["USD"]
    price2 = response["BTC"]
    price3= response["GBP"]
    price4 = response["SGD"]
    
    time = datetime.now().strftime("%H:%M:%S")

    labelPrice.config(text= "$"+ str(price) + " USD")
    labelPrice2.config(text= str(price2) + " BTC")
    labelPrice3.config(text= "£"+ str(price3) + " GBP")
    labelPrice4.config(text= "$"+ str(price4) + " SGD")
    
    labelTime.config(text= "Updated at: " + time)

    canvas.after(1000, trackEth)

canvas = tk.Tk()
canvas.geometry("400x500")
canvas.title("Ethereum Tracker")

f1= ("Comic Sans MS", 24,"bold")
f2= ("Comic Sans MS", 22,"bold")
f3= ("Comic Sans MS", 22,"bold")
f4= ("Comic Sans MS", 22,"bold")
f5= ("Comic Sans MSn", 22,"bold")
f6= ("Comic Sans MS", 18,"normal")

label= tk.Label(canvas, text ="Ethereum Price", font= f1)
label.pack(pady=20)

labelPrice = tk.Label(canvas, font= f2)
labelPrice.pack(pady= 20)

labelPrice2 = tk.Label(canvas, font= f3)
labelPrice2.pack(pady= 20)

labelPrice3 = tk.Label(canvas, font= f4)
labelPrice3.pack(pady= 20)

labelPrice4 = tk.Label(canvas, font= f5)
labelPrice4.pack(pady= 20)

labelTime= tk.Label(canvas, font= f6)
labelTime.pack(pady=20)


trackEth()

canvas.mainloop()