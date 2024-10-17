
#!/binbash
#Punt 1
	cut -d',' -f 1-11,13-15 supervivents.csv > temporal.csv
#Punt 2
	awk -F ',' '{ if ($14 == "False") print $0 }' temporal.csv >> temporal2.csv
	a=$(wc -l < temporal.csv)
	b=$(wc -l < temporal2.csv)
	numerror=$((a-b))

#Punt 3
	awk -F',' '{ if ($8 < 1000000) {print $0 ",Bo"} else if ($8 <= 10000000) {print $0 ",Excel·lent"} else{print $0 ",Estrella"}}' temporal2.csv >> temporal3.csv

#Punt 4
	cont=0
	while  [ $cont -lt $b ]; do
		read x
    		likes=$(echo $x | cut -d',' -f9)
    		dislikes=$(echo $x | cut -d',' -f10)
    		views=$(echo $x | cut -d',' -f8)
		y=$((likes*100/views))
		z=$((dislikes*100/views))
		echo "$x,$y,$z" >> sortida.csv
	cont=$((cont+1))
	done < temporal3.csv

#Punt 5
	if ["$#" -eq 1]; then
		id=$1
		sortida=$(grep -w "^$id" sortida.csv)
		if (grep -n "^$sortida"); then
			echo "$id" | cut -d ',' -f3,6,8,9,10,15,16,17
		else
			echo "No s'ha trobat cap coincidència."
		fi
	fi
fi



