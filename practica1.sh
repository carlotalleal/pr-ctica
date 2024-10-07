
#!/bin/bash
	cut -d',' -f 1-11,13-15 supervivents.csv > temporal.csv
	awk -F ',' '{ if ($14 == "False") print $0 }' temporal.csv >> temporal2.csv
	a=$(wc -l < temporal.csv) 
	b=$(wc -l < temporal2.csv)
	numerror=$((a-b))
fi

