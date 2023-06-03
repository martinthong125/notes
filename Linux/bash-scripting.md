# Bash Scripting

## See all available shells

```sh
cat /etc/shells
```

Script name end with .sh

## shebang at the start of script

#!/bin/bash

## Portability - change shebang to work with different flavours of linux

#!/usr/bin/env bash

## Execution permission

chmod +x \<filename\>

chmod 755 \<filename\>

## Run the script

./\<filename\>

## Help commands

whatis \<command\>

man \<command\>

## Send gmail function?

Install docker

uname # OS

uname -n #hostname

## Redirection Operators

\> - save to a new file

\> \> - append to file

\< - to provide the input

| - to send the output of a command to a second command

## File descriptors:

0: STDIN

1: STDOUT

2: STDERR

1\> \<filename\> - stores stdout

2\> \<filename\> - store stderr

&\> \<filename\> - store both stdout and stderr in filename

## Read a file content

vi \<filename\>

:set number - display line number

cat -n \<filename\> - display content with line number

less \<filename\> - can scroll content line by line

more -n \<filename\> - display content up to line n

more +n \<filename\> - display content from line n

## Read a file with conditions - tail, grep, awk, sed

head -n \<filename\> - display top n lines of filename

tail -n \<filename\> - display bottom n lines of filename

To print line 6 to 12:

head -12 \<filename\> | tail -7

awk 'NR\>=6 && NR\<=12 {print}' \<filename\>

sed -n '6,12p' \<filename\>

## grep command

a filter command to search string in a file

grep [options] '\<word(s)\>' filename(s)

options

-i case insensitive

-w exact word

-v lines without the word

-o only the word from the line

-n with line number

-c count of word appearance

-cw count of exact word appearance

-A n display n lines after word

-B n display n lines before word

-C n display n lines before and after word

-r to search current and sub directories

-l display the filename if matched

-h hide the filename

-f replace word with a file that contains the word. eg. grep -f \<searchfile\> \<filename\>

-e , repeat for all the words you want to search eg. grep -e "word1" -e "word2" -e "word3" \<filename\>

-E , like OR. eg. grep -E "word1|word2|word3" \<filename\>

## Pattern is a string and it represents more than one string (regex)

use -E to work with patterns

xy | pq - xy or pq

^abc - start with abc

xyz$ - end with xyz

^$ - empty lines

\ - remove special symbols \^

. - matches any character

\b - match the word at the edge. eg. \bline, line\b

? - the preceding character is optional or matched 1 time

\* - the preceding character is matched 0 or more times

\+ - the preceding character is matched 1 or more times

[xyz] - matches the line having x or y or z

[a-d] - matches the line having a|b|c|d

^[abc] - matches the line starting a|b|c

[^abc] - does not match a|b|c

{N} - the preceding string matched exactly N times

{N,M} - the preceding string matched exactly N or M times

{N,} - the preceding string matched N or more times

{,N} - the preceding string matched N or less times

[[:digit:]] - find lines with digit

[[:upper:]] - find lines with uppercase letter

[[:lower:]] - find lines with lowercase letter

[[:blank:]] - find lines with space or tab

[[:space:]] - find lines with special characters

## cut command

to extract parts of each line from a file, character or fields

eg. cut -c 1 /etc/passwd # get the first character of every line in the file

eg. cut -f 2-4 \<filename\> # get the second to fourth field/column of every line in the file

default field separator is tab. To change the field separator, use the -d flag

eg. cut -d ':' -f 1,4 /etc/passwd --output-delimeter=" " # change field separator to ':' and output field 1 and 4 separated by space.

eg. cut -sf 2 \<filename\> # to output field 2 when the separator is a tab. Non-tab separator lines are ignored.

## awk command

to extract field from the file

default field separator is space.

can set field separator to more than a single character

httpd -v | awk -F '[ /]' '/version/ {print $4}' # 2 field separator, space and slash. Search for line with the word version and print the 4th field in that line.

lines are known as records in awk

awk '[action]' \<filename\>

$0 - entire file

$1 - first field from each line

$2 - 2nd field from each line

NR - print the number of rows

NF - print the number of fields

## tr command

short for translate. ie to translate or delete sets of characters from the input

tr [options] [set1] [set2] \<filename\>

docker -v | cut -d ' ' -f 3 | tr -d , # cut command will change field separator to space and extract the 3rd field. Then tr command will delete the comma.

tr -d "[()]" # delete '(' and ')'

## tee command

display output and store the output to a file. Similar to python logging

useful for creating logs for shell scripting

cat \<filename\> | tee -a \<abc.log\> # -a to append, without -a will overwrite abc.log

## echo command

echo \<message\>

echo -e "Col1\tCol2" # to activate escape character \t aka tab

escape characters

\n new line

\t horizontal tab

\v vertical tab

\b backspace

\r carriage return

\ escape character etc

echo -n \<message\> # cursor will not go to the next line after printing message

## heredoc for multi-lines or multi-block

cat \<\< EOF

line 1

line 2

EOF

## herestring

command \<\<\< string

tr [a-z] [A-Z] \<\<\< $(docker -v)

## Debugging bash scripts with set command

set [options]

set -n # No execution, purely for syntax check

set -x # print the command before executing the script

set -e # exit the script if any command fails

bash -x \<script\> # debugging the script

## Exit status of a command

0 #script executed successfully

echo $? to check exit status

if output is not equal to zero, the last command fails.

Error code

127 # command not found

1 # command failed during execution

2 # incorrect command usage

## string operation

find length of string: xlen=${#x}

concatentation of string: xyResult=${x}${y}

convert strings to lower/upper case: xU=${x^^} , yL=${y,,}

replace part of the string in a variable: newY=${y/old_word/new_word}

slicing part of the string in a variable: ${var:start:length}

## string operations on paths

realpath: converts each filename argument to an absolute pathname eg. realpath \<filename\>

basename: strips directory information. Eg. basename \<fullpath\> , basename\<fullpath\> .py # removes .py extension.

dirname: delete suffix with the last slash character and return the result. Eg. dirname \<fullpath\>

input with read command, output with echo command

## Arithmetic Operators

using declare

using expr

using let

using (( )) - for integers

using bc - for integer and float (bash calculator)

## test command

a command to judge conditions

[[condition]]

returns true or 0 if condition is true

numbers comparison

-eq # equal

-ne # not equal

-lt # less than

-le # less than or equal to

-gt # greater than

-ge # greater than or equal to

strings comparison

-z # length of string is zero

-n # length of string is non-zero

== # both strings are equal

!= # both strings are not equal

file test

-d # file/path is directory

-f # file/path is file

-e # file/path exists

-r # file/path is readable

-w # file/path is writable

-x # file/path is executable

## Command chaining operators

to combine several commands for shorter shell scripts

command chaining operators

semi-colon operator ;

cmd1 ; cmd2 # run cmd1 and then cmd2 regardless cmd1 pass or fail

Logical AND operator &&

cmd1 && cmd2 # run cmd1 and only run cmd2 if cmd1 succeed.

Logical OR operator ||

cmd1 || cmd2 # run cmd2 only if cmd1 fail

## Logical operators

Logical AND operator: && and -a

eg. [[condition1 && condition 2]] or [condition1 -a condition2]

[[]] is new improved method, [ ] is old method

Logical OR operator: || and -o

eg. if [[$result = yes || $result = y]] # no quotations of any kind in brackets and can accept single = sign

Logical NOT operator: !

[[! condition]] - # if condition is true, it will change to false. vice versa.

## Scheduling jobs

at - one time task

at HH:MM AM

at\> bash \<script_name\>

Control + D to exit

OR echo "bash \<script_name\>" | at HH:MM AM

atq # see jobs

atrm \<job_number\> # remove job

crontab - running specific tasks on a regular interval

min hr day month weekday command/script

6 fields

crontab -e # create a job

crontab -l # list all jobs

crontab -r # delete all jobs

## Array

emptyArray=()

myArray=(one two three four)

${myArray[*]} # print all values

${myArray[*]:1} # print all values starting from index 1

${myArray[*]:1:2} # print 2 values starting from index 1

${!myArray[*]} # print index value of array

${#myArray[*]} # print the length of array

unset myArray # delete array

read -a myArray # read input as array

read -p "Enter your array" -a myArray

declare -a myArray # index-based array

declare -A myArray # dictionary, associative array, key-value pair

## Loops

for loop

for each in 1 2 3 # loop 3 times

for ((x=1; x\<=3; x++)) # C syntax

## Difference between $\* and $@

for each in "$@"

use $@ in a loop to separate the items in a list

$\* if you want to use as a single line argument

## Loop control commands

break

continue

## Login to remote server

ssh

password

vi /etc/ssh/sshd_config # check if password Authentication yes/no, for password login

ssh user_name@remote_ip # best method to login

ssh key # passwordless login

ssh-keygen to get private and public key in .ssh directory

ssh-copy-id user_name@remote_ip # copy public key to remote server

ssh -o StrictHostKeyChecking=No user_name@remote_ip # no need to key in yes/no

## Execute commands on remote server using ssh key

ssh -o StrictHostKeyChecking=No user_name@remote_ip "cmd"

ssh -o StrictHostKeyChecking=No user_name@remote_ip "cmd1;cmd2;cmd3"

## sshpass - when password is required to login to server

ssh -f filename ssh -o StrictHostKeyChecking=No user_name@remote_ip "cmd" # password is in filename

## Executing multiple commands on multiple servers

use nested for loop

outer loop - run through all the servers

inner loop - run through all the commands

## Infinite loop

for( ;; )

while true

## awk command/script

a programming language

a scripting language

default field separator: space

awk is used to find and replace some text

rows = records, columns = fields

change field using -F option

NF - number of fields, NR - number of records

awk options 'pattern {action}' \<filename\>

\<cmd\> | awk options 'pattern {action}'

pattern similar to condition, without pattern action will work on every line

to specify a file that contains awk script: -f \<filename\>

to declare a variable: -v var=value in the BEGIN section or pattern/condition and print it in action

action is repeated for each record in the file, usually print something

awk '{ print $1,$3 }' \<filename\>

awk '{ print NR,$1,$NF }' \<filename\> # show line number and print first and last field

awk '{ print "The line number is: ", NR, "The number of fields on this line are: ",NF }' \<filename\>

awk '{ print FILENAME }' \<filename\> # print filename on every line

awk -f \<awk_script.awk\> \<filename\>  # run the awk script using a file

BEGIN block is performed before reading the file

END block is performed after processing the file

Rest of the actions are performed while processing the file

awk 'BEGIN { print "Start of script" } /root/ { print $0 } END { print "End of script" }' /etc/passwd

awk script must include the shebang #! /usr/bin/awk -f

use awk in bash script to do calculation is good practice

bash variables is not the same as awk variables. Need to declare separately again in awk

## SED - Stream Editor

view file content like cat command

searching for lines with a particular pattern/word

find and replace

insertion or deletion

supports regex

edit file without opening it

sed [ options ] commands \<filename\>

sed -n 'p' \<filename\> # print the whole file with line number

sed -n '1,10p' \<filename\> # print line 1 to 10 with line number

sed -n '$p' \<filename\> # print the last line in the file

sed '4,$d' \<filename\> # print only line 1 to 3. 4 onwards are deleted

sed '5,+10d' \<filename\> # delete line 5 and 10 additional lines after.

sed -i '4,6d' \<filename\> # -i perform the operation on the file

sed -i.bak '3,$d' \<filename\> # -i.bak backup the file and then perform the operation. You can choose the backup extension.

sed -n '/\<word/string\>/p' \<filename\> # search for word or string in the file

sed -n -e '/\<word1\>/p' -e '/word2/p'\<filename\> # search for word1 and word2 in the file

sed -e ' /^#/d ; /^$/d ' \<filename\> # delete comments and then delete empty lines

sed -n "/$search/p" serverList.txt # use double quotes for searching with a variable

sed -n '/\<word\>/!d' \<filename\> # ! will negate the search result. ie delete the lines that does not have the \<word\>

sed 's/\<old\>/\<new\>/' \<filename\> # search for \<old\> and replace it with \<new\> 1 time

sed 's/\<old\>/\<new\>/i' \<filename\> # search for \<old\> case-insensitive and replace it with \<new\> 1 time

sed 's/\<old\>/\<new\>/g' \<filename\> # search for \<old\> and replace it with \<new\> for all instance

sed 's/\<old\>/\<new\>/2' \<filename\> # search for \<old\> and replace it with \<new\> for the 2nd instance

sed '/\<search\>/s/\<old\>/\<new\>/' \<filename\> # search for \<search\> and substitute \<old\> and replace it with \<new\> 1 time

sed '1i \<header to be inserted\>' \<filename\> # 1i means insert before line 1. The content is \<header to be inserted\>

sed '$a \<message\>' \<filename\> # $a means append after the last line. The content is \<message\>

sed '3d' \<filename\> # delete the 3rd line in file

sed '/\<word\>/d' \<filename\> # search for \<word\> and delete the line with the \<word\>

sed -n '/p[ou]t/p' \<filename\> # regex in search, match both put and pot.

regex in sed: special characters

\s # space

\ # escape character

\t # tab

. # dot matches everything except newline

\* # asterisk matches 0 or more times the previous character

\+ # plus matches at least 1 time the previous character

\? # question mark matches 0 or 1 time the previous character

^ # carot matches the start of the line

$ # dollar matches the end of the line

[] # matches any single character in the list

{} # matches the previous character a certain number of times

() # select the word you want to match a certain number of times

sed -i '/^$/d' \<filename\> # delete empty lines in file

sed -i '/p[you]t/d' \<filename\> # matches pyt, pot, put

sed -i '/p[a-o]t/d' \<filename\> # matches pat to pot

sed -i '/p[a-ox-z]t/d' \<filename\> # matches pat to pot and pxt to pzt

sed -i '/This\{3\}\b/d' \<filename\> # matches with 3 s, \b - space

sed -i '/This\{3,4\}\b/d' \<filename\> # matches with 3 or 4 s \b - space

sed -i '/This\{3,\}\b/d' \<filename\> # matches with 3 or more s \b - space

sed -i '/\(This\)\{2\}\b/d' \<filename\> # matches This 2 times
