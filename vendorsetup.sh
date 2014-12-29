for combo in $(curl -s https://raw.githubusercontent.com/Plain-Andy/build-targets/lp-legacy/plain-build-targets | sed -e 's/#.*$//' | awk {'print $1'})
do
 add_lunch_combo plain_$(echo $combo)-user
done
