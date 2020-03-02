
function backup_if_exists()
{
    if [ -z $1 ]
    then
        echo "Not enough params for backup_if_exists"
        return
    fi

    local file=$1
    local bkp_dir=$2
    #echo "bkp_if file = $file bkp_dir = $bkp_dir"
    if [ -z $bkp_dir ]
    then
        bkp_dir=backup_config_
    fi

    if [ -f $file ] || [ -d $file ]
    then
        echo "$file exists copy to $bkp_dir"
        if [ ! -d $bkp_dir ]
        then
            mkdir $bkp_dir
        fi
        mv $file $bkp_dir/$(basename $file)
    else
        if [ -h $file ]
        then
            echo "$file is a symlink removing.."
            rm "$file"
        fi 
    fi
}

function link_or_fail()
{
    if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
    then
        echo "ERROR: Not enough params for link_or_fail"
        return
    fi

    local file=$1
    local dest=$2
    local bkp_folder=$3
    
    #echo "link_or file = $file dst = $dest bkp_dir = $bkp_folder"

    backup_if_exists $dest $bkp_folder
    echo "ln -s $file $dest"
    ln -s $file $dest
    if [ $? -eq 0 ]
    then
        echo "$file installed in $dest"
    else
        echo "ERROR: Failed to link $file in $dest"
    fi
}

function append() {
    destination=$1
    file=$2
    if [ ! -f $file ]
    then
        echo "ERROR: No souch file '$file'"
        return
    fi
    cat $file >> $destination
}


# $1 file destination
# $2 source dir for file parts
# $3 [optional] the hostname for which to generate
#
# The function will iterate from 00_*.cfg to 99_*.cfg and try to append all
# parts to the destination If there are more parts for an index, it will choose
# the one for which the hostname is in the name, ignoring the rest
function assembleFile() {
    destination="$1"
    sourceDir="$2"
    hostname=$3

    if [ -z "$hostname" ]
    then
        hostname=$(hostname)
    fi

    cat /dev/null >  "$destination"

    for i in {00..99}
    do
        files=$(ls -1 ${sourceDir}/${i}_*.cfg 2> /dev/null )
        nrFiles=$(echo "$files" | wc -l)
        configPart=
        if [ $nrFiles -eq 1 ]
        then
            configPart="$files"
        elif [ $nrFiles -gt 1 ]
        then
            configPart=$(echo "$files" | grep $hostname)
        fi
        
        if [ -n "$configPart" ]
        then
            echo "$configPart" 
            cat  "$configPart" >> "$destination"
        fi
    done
}

