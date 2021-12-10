#!/bin/bash
mount_dir=/opt/vpnuser
if [[ -d "$mount_dir" ]]; then
        declare -a vpn_users
        declare -a vpn_routers
        vpn_users=($(find /folder/ -maxdepth 1 -type f -not -path '*/\.*' | sed 's/^\/folder\///g' | sort))
        vpn_routes=($(find /folder1/folder2/folder3/ -maxdepth 1 -type f -not -path '*/\.*' | sed 's/^\/folder1\/folder2\/folder3\///g' | sort))
        for group_name in ${vpn_users[@]}; do
                for i_route in ${vpn_routes[@]}; do
                        #echo "$group_name vs $i_route"
                        #echo "${i_route%%.*}"
                        if [[ "$group_name" =~ "${i_route%%.*}" ]]; then
                                echo "$group_name - $i_route"
                                for user_name in $(cat /folder/folder2/$group_name); do
                                        touch /folder1/folder2/folder3/$user_name
                                        str_routes_count=${#username[@]}
                                        echo "$str_routes_count"
                                        echo "Number of exist routes $str_routes_count"
                                        for string_route in $i_route; do
                                              count_yes=0
                                              for string in $user_name; do
                                                    if [ "$string" != "$string_route" ]; then
                                                          count_yes=$((count_yes + 1))
                                                    fi
                                              done
                                              if [[ $count_yes == $str_routes_count ]]; then
                                                cat /folder1/folder2/folder3/$string_route >> /folder1/folder2/folder3/$user_name
                                                echo "$string_route add to $user_name"
                                              fi
                                        done
                                done
                        fi
                done
        done
else
        echo "Directry $mount_dir is not exist"
fi
