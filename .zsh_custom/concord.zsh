run-front() {
	echo "Running concord-app-front..."
	cd ~/concord/git/concord-app-front
	echo "Checking out origin/master...."
	git fetch --all --prune
	git checkout origin/master
	echo "Running docker-compose..."
	docker-compose up -d --build dev-proxy
	echo "Running serve..."
	cd ~/concord/git/concord-app-front/services/front/
	npm ci
	npm run serve
}

alias nego="cd ~/concord/Negotiation-App"
alias pdfdebug="java -jar ~/devenv/pdfbox-app-2.0.21.jar PDFDebugger $1"
