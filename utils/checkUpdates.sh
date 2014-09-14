#Define commands for checking last system update
debian="stat -c %y /var/log/apt/history.log"
arch="stat -c %y /var/log/pacman.log"

#runs the given command on the given server if it is running
# run $addr $command
function check {
    ping -c 3 $1 > /dev/null
    if [ $? -eq 0 ]
    then
        echo -n "${1}: "
        ssh $1 $2
    fi
}

#Run on boxes
echo -n "Archbox: "
$arch

check pi.lan "$debian"
check server.lan "$debian"
check xps.lan "$debian"
