#!/usr/bin/env bash

printf "#################################\n"
printf "#####      Start env        #####\n"
printf "##### Checking requirements #####\n"
printf "#################################\n\n"

source /sry/bettingatsage/.venv/bin/activate
pip install -r /sry/bettingatsage/test_requirements.txt



cat > ~/.screenrc <<EOF
defutf8 on
defencoding UTF-8
vbell off
startup_message off
autodetach on

mousetrack on

# 256 colors
attrcolor b ".I"
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
defbce on

#default windows
screen -t Htop       1 htop
screen -t MC         2 mc
screen -t Python     3 python
screen -t PSQL       4 sudo su - postgres
select 4
stuff "psql^M"
chdir /sry/bettingatsage
screen -t Bash       5 bash
select 5
stuff "export SQL_SETUP=psql://myapp:dbpass@localhost:5432/myapp^M"
stuff "source /sry/bettingatsage/.venv/bin/activate^M"
stuff "cd /sry/bettingatsage/bettingatsage^M"
screen -t BettServer 6 bash
select 6
stuff "export SQL_SETUP=psql://myapp:dbpass@localhost:5432/myapp; source /sry/bettingatsage/.venv/bin/activate; python /sry/bettingatsage/bettingatsage/manage.py runserver 0.0.0.0:8000^M"

bind c screen 1
bind 0 select 10

zombie kr
setenv DISPLAY ':0'
termcapinfo xterm|xterms|xs|rxvt ti@:te@
defscrollback 10000
hardstatus on
hardstatus alwayslastline
hardstatus string "%{= bk}%-Lw%{= rW}%50> %n%f* %t %{-}%+Lw%< %= %{= Gk} %H %{= rW} %l %{= Gk} %0c:%s %d/%m %{-}"

EOF

printf "#################################\n"
printf "#####  READY TO GO BETTING  #####\n"
printf "#################################\n\n"

cat << "EOF"
  ____       _   _   _                          _____
 |  _ \     | | | | (_)                ____    / ____|
 | |_) | ___| |_| |_ _ _ __   __ _    / __ \  | (___   __ _  __ _  ___
 |  _ < / _ \ __| __| | '_ \ / _` |  / / _` |  \___ \ / _` |/ _` |/ _ \
 | |_) |  __/ |_| |_| | | | | (_| | | | (_| |  ____) | (_| | (_| |  __/
 |____/ \___|\__|\__|_|_| |_|\__, |  \ \__,_| |_____/ \__,_|\__, |\___|
                              __/ |   \____/                 __/ |
                             |___/                          |___/
EOF
