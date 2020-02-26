
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


