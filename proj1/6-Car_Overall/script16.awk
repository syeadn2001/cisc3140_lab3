BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# print the car id and car_overall for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7","$14;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS $14;
	}
}
}
