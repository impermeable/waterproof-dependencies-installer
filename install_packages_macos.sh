#!/usr/bin/bash


#######################################
# Installs Github repository.
# Globals:
#   -
# Arguments:
#   $1 Owner of repository.
#   $2 Repository name.
# Outputs:
#   Creates compiled package in Coq directory
#######################################
function install_package_github {
  echo "Installing Github package $1/$2."
  
  # Clone repo
  git clone https://github.com/$1/$2

  # Build and install repository
  cd $2  # Enter repository
  make
  make install
  cd ..  # Leave repository
  rm -rf $2  # Delete repository
  
  echo "Finished installing Github package $1/$2."
}

#######################################
# Let create installer script create package unselected by default.
# Globals:
#   -
# Arguments:
#   $1 package
# Outputs:
#   Changes create installer script to have $1 unselected by default in installer
#######################################
function unselect {
      sed -i '/^###### Create the NSIS installer #####/a unselect_package '"$1" windows/create_installer_windows.sh
}

# Create folder in which to perform Github clones
mkdir github_packages

config_file=$1
# Read all lines not starting with #
grep -v '^#' $config_file | while read -r line ; do
  eval "package_info=($line)"

  package_name=${package_info[1]}
  package_selected=${package_info[2]}
  
  if [ "$package_selected" == "UNSELECTED" ] ; then
    unselect ${package_info[1]}
  fi
  
  if [[ $line =~ ^GITHUB* ]] ; then
    package_path=${package_info[3]}
    package_description=${package_info[4]}
    owner_name=${package_info[5]}
    repo_name=${package_info[6]}

    cd github_packages
    install_package_github $owner_name $repo_name
    cd ..

    echo "Current directory in install_packages_macos"
    pwd 

    # Inject install code into installer script
    # Only testing that add_folder_recursively works, update later
    sed -i '/^source "${HERE}"/shell_scripts/installer_create_tree.sh/a add_folder_recursively "lib/coq/user-contrib/" "Waterproof" ' platform/macos/create_installer_macos.sh
  elif [[ $line =~ ^OPAM* ]] ; then
    opam install -y $package_name
  fi
done

# Remove folders in which to 
rmdir github_packages

# Inject install imports into create installer script
#sed -i '/^source "${HERE}"/shell_scripts/installer_create_tree.sh/a source add_custom_macos.sh' platform/macos/create_installer_macos.sh  # Custom package functions

# Unneccesary?
#sed -i '/^###### Create the NSIS installer #####/a source unselect_packages.sh' platform/macos/create_installer_macos.sh  # Unselect package functions

cat platform/macos/create_installer_macos.sh
