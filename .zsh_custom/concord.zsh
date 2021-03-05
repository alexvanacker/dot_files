run-front() {
	echo "Running concord-app-front..."
	cd ~/concord/git/concord-app-front
	echo "Checking out origin/master...."
	git fetch --all --prune
	git reset --hard  origin/master
	echo "Running docker-compose..."
	docker-compose up -d --build dev-proxy front
}

alias nego="cd ~/concord/Negotiation-App"
alias pdfdebug="java -jar ~/devenv/pdfbox-app-2.0.21.jar PDFDebugger $1"
