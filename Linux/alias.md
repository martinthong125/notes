# Useful aliases

https://pastebin.com/kuSr3bCA

## My aliases for Ubuntu

alias kub='kubectl'

alias mkdir='mkdir -pv'

alias ping='ping -c 5'

alias t1='echo "Terraform init..." && terraform init'

alias t2='echo "Terraform fmt & validate..." && terraform fmt && terraform validate'

alias t3='echo "Terraform plan -out=tfplan.out..." && terraform plan -out=tfplan.out'

alias t4='echo "Terraform apply tfplan.out..." && terraform apply tfplan.out'

alias t5='echo "Terraform destroy --auto-approve..." && terraform destroy --auto-approve'

alias gamend='echo "git add changes to current folder, no amend commit and push force..." && git add ./ && git commit --amend --no-edit && git push -f'

alias untar='tar -zxvf '

alias update='sudo apt-get update && sudo apt-get upgrade'

alias wget='wget -c '

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

alias mem5='ps auxf | sort -nr -k 4 | head -5'

alias cpu5='ps auxf | sort -nr -k 3 | head -5'

alias reload="source ~/.bashrc"
