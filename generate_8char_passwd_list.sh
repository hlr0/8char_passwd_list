#!/bin/bash
#USAGE: parallel -n2 -P3 bash ::: ./generate_8char_passwd_list.sh

#Description
# Make sure GNU parallel and screen is installed on your system before using this file.

#apt install parallel
#apt install screen

# declare an array called array and define values
array=( a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0 '!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '_' '-' '=' '+' '`' '~' '{' '}' '|' ':' '"' '<' '>' '?' '[' ']' '\' ';' "'" ',' '.' '/' )

# Calculate the size of each file in bytes (48MB)
file_size=$((48 * 1024 * 1024)) #48mb in size

# Initialize counter for total data written
total_data_written=0

# Initialize file counter
file_counter=1

# Output file prefix
output_file_prefix="8char_passwd_file"

# Output file extension
output_file_extension=".txt"

# Output file name
output_file="${output_file_prefix}_${file_counter}${output_file_extension}"

# Loop until all data has been written
while [ $total_data_written -lt $file_size ]; do
    current_size=0
    
    # Loop until the file size reaches 100MB
    while [ $current_size -lt $file_size ]; do
        for a in "${array[@]}"; do
            for b in "${array[@]}"; do
                for c in "${array[@]}"; do
                    for d in "${array[@]}"; do
                        for e in "${array[@]}"; do
                            for f in "${array[@]}"; do
                                for g in "${array[@]}"; do
                                    for h in "${array[@]}"; do
                                        echo "$a$b$c$d$e$f$g$h" >> "$output_file"
                                        current_size=$(stat -c%s "$output_file")
                                        total_data_written=$((total_data_written + 8))
                                        
                                        # Check if file size has exceeded 100MB
                                        if [ $total_data_written -ge $file_size ]; then
                                            echo "File $output_file created."
                                            
                                            # Increment file counter and create a new output file
                                            ((file_counter++))
                                            output_file="${output_file_prefix}_${file_counter}${output_file_extension}"
                                            
                                            # Reset total data written for the new file
                                            total_data_written=0
                                        fi
                                    done
                                done
                            done
                        done
                    done
                done
            done
        done
    done
done

