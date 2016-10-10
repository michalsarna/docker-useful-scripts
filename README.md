# docker-useful-scripts
Scripts that are useful when working with docker images

## clean_dead_containers.sh
This script removes (with --force) all containers that are in "Dead" state.

##clean_none_images.sh
This script removes all images that has no name on "none" is in their  name.

##remove_exited_containers.sh
This script removes all containers that are in "Exited" state.

##remove_unused_volumes.sh
This script lists all volumes that are on host and lists all volumes (mount points) that are currently in use and removes only ones that are not in use any more.
!! Waring this was tested only on docker 1.12.1 and may not work with previous versions, since there is no "docker inspect -f {{.Volumes}} <container_id_or_name>" in 1.12.1
