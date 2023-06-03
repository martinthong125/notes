# Useful aliases

https://pastebin.com/kuSr3bCA

## My aliases for Ubuntu

alias kub='kubectl'

alias mkdir='mkdir -pv'

alias ping='ping -c 5'

alias t1='terraform init'

alias t2='terraform plan'

alias t3='terraform apply --auto-approve'

alias t4='terraform destroy --auto-approve'

alias untar='tar -zxvf '

alias update='sudo apt-get update && sudo apt-get upgrade'

alias wget='wget -c '

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

alias mem5='ps auxf | sort -nr -k 4 | head -5'

alias cpu5='ps auxf | sort -nr -k 3 | head -5'

alias reload="source ~/.bashrc"
