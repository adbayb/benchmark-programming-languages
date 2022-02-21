const fs = require("fs");

function main() {
	const buffer = fs.readFileSync("assets/unsplash.jpg", {
		flag: "r",
	});

	console.log("Bytes read:", buffer.length);
}

main();
