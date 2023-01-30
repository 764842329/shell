#切换git分支
#如果当前目录是一个git目录，则直接切换
#如果当前目录包含多个git目录，则将目录下全部项目切换到指定分支
branch_name=$1
echo $branch_name
temp=`ls -a|grep git`
if [[ -n $temp ]]; then
        branchs=`git branch`
        branch_arry=(${branchs})
        if [[ ${branch_arry[@]/${branch_name}/} != ${branch_arry[@]} ]]; then
                git checkout $branch_name
        else
                git checkout -b $branch_name origin/$branch_name
        fi
else
        project=`ls -l|awk '/^d/ {print $NF}'`
        echo $project
        for var in ${project}
        do
                echo ${var}
                cd ${var}
                temp=`ls -a|grep git`
                if [[ -n $temp ]]; then
                        branchs=`git branch`
                        branch_arry=(${branchs})
                        if [[ ${branch_arry[@]/${branch_name}/} != ${branch_arry[@]} ]]; then
                                git checkout $branch_name
                        else
                                git checkout -b $branch_name origin/$branch_name
                        fi

                fi
                cd ..
        done
fi
