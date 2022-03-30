.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	# awk -f proj2/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx
	
	# run awk script and print output to report.csv
	awk -f proj2/prog.awk data/data.csv > proj2/report.csv

	# paste -d' ' <(cut -d' ' -f1-5 proj2/report.csv ) <(cut -d' ' -f6- proj2/report.csv |sort -n) > proj2/sortedreport.csv

	# run awk script to calculate racer total for each car and save output to output1.csv
	awk -f proj2/1-Racer/script1.awk data/data.csv | sort -t, -k2rn > proj2/1-Racer/output1.csv	

	# run awk script to rank cars based on racer total and save output to output2.csv
	awk -f proj2/1-Racer/script2.awk proj2/1-Racer/output1.csv > proj2/1-Racer/output2.csv
	
	# run awk script to print top 3 cars based on racer total and save output to output3.csv
	awk -f proj2/1-Racer/script3.awk proj2/1-Racer/output2.csv > proj2/1-Racer/output3.csv

	# run awk script to calculate engine total for each car and save output to output4.csv
	awk -f proj2/2-Engine/script4.awk data/data.csv | sort -t, -k2rn > proj2/2-Engine/output4.csv

	# run awk script to rank cars based on engine total and save output to output5.csv
	awk -f proj2/2-Engine/script5.awk proj2/2-Engine/output4.csv > proj2/2-Engine/output5.csv

	# run awk script to print top 3 cars based on engine total and save output to output6.csv
	awk -f proj2/2-Engine/script6.awk proj2/2-Engine/output5.csv > proj2/2-Engine/output6.csv

	# run awk script to calculate body frame total for each car and save output to output7.csv
	awk -f proj2/3-Body_Frame/script7.awk data/data.csv | sort -t, -k2rn > proj2/3-Body_Frame/output7.csv

	# run awk script to rank cars based on body frame total and save output to output8.csv
	awk -f proj2/3-Body_Frame/script8.awk proj2/3-Body_Frame/output7.csv > proj2/3-Body_Frame/output8.csv

	# run awk script to print top 3 cars based on body frame total and save output to output9.csv
	awk -f proj2/3-Body_Frame/script9.awk proj2/3-Body_Frame/output8.csv > proj2/3-Body_Frame/output9.csv

	# run awk script to calculate mods total for each car and save output to output10.csv
	awk -f proj2/4-Mods/script10.awk data/data.csv | sort -t, -k2rn > proj2/4-Mods/output10.csv

	# run awk script to rank cars based on mods total and save output to output11.csv
	awk -f proj2/4-Mods/script11.awk proj2/4-Mods/output10.csv > proj2/4-Mods/output11.csv

	# run awk script to print top 3 cars based on mods total and save output to output12.csv
	awk -f proj2/4-Mods/script12.awk proj2/4-Mods/output11.csv > proj2/4-Mods/output12.csv

	# run awk script to calculate mods overall for each car and save output to output13.csv
	awk -f proj2/5-Mods_Overall/script13.awk data/data.csv | sort -t, -k2rn > proj2/5-Mods_Overall/output13.csv

	# run awk script to rank cars based on mods overall and save output to output14.csv
	awk -f proj2/5-Mods_Overall/script14.awk proj2/5-Mods_Overall/output13.csv > proj2/5-Mods_Overall/output14.csv	

	# run awk script to print top 3 cars based on mods overall and save output to output15.csv
	awk -f proj2/5-Mods_Overall/script15.awk proj2/5-Mods_Overall/output14.csv > proj2/5-Mods_Overall/output15.csv

	# run awk script to calculate car overall for each car and save output to output16.csv
	awk -f proj2/6-Car_Overall/script16.awk data/data.csv | sort -t, -k2rn > proj2/6-Car_Overall/output16.csv	

	# run awk script to rank cars based on mods overall and save output to output17.csv
	awk -f proj2/6-Car_Overall/script17.awk proj2/6-Car_Overall/output16.csv > proj2/6-Car_Overall/output17.csv	

	# run awk script to print top 3 cars based on car overall and save output to output18.csv
	awk -f proj2/6-Car_Overall/script18.awk proj2/6-Car_Overall/output17.csv > proj2/6-Car_Overall/output18.csv

p3:
	@echo "Running AWK Script proj3: "
	#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
	awk -f proj3/prog1.awk data/data.csv

	#moved to proj3 directory
	mv top_3 proj3
	mv ranks proj3 
	mv headers proj3

	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks. Sorts top_3 via maker first then ranks
	sort -k5,5rn -t '|' proj3/ranks > "sorted_ranks"
	sort -k3,3 -k5,5rn -t '|' proj3/top_3 > "top_3"

	#moved to proj3 directory
	mv sorted_ranks proj3 
	mv top_3 proj3 
	#awk file to only take top three cars for each maker
 #	awk -f proj3/top_3.awk proj3/top_3

	#Adding headers to final files
	cat proj3/headers proj3/sorted_ranks > "sorted_ranks"
	cat proj3/headers proj3/top_3 > "top_3"
	#moved to proj3 directory
	mv sorted_ranks proj3 
	mv top_3 proj3

	#Display the files
	echo "\n\n"
	cat proj3/sorted_ranks
	echo "\n\n"
	cat proj3/top_3
