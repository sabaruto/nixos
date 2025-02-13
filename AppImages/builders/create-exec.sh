#! /run/current-system/sw/bin/bash -e
username="dosia"

app_images="/home/${username}/nixos/AppImages"
binaries_path="${app_images}/binaries"
bash_bin="/home/${username}/.local/state/nix/profiles/bin"

binaries=$(ls "${app_images}/binaries")

for binary in "${binaries[@]}"; do
    bash_path="$bash_bin/run-${binary%AppImage}sh"

    echo "#! /run/current-system/sw/bin/bash -e" >"$bash_path"
    echo "exec -a $binary appimage-run $binaries_path/$binary" >>"$bash_path"
    chmod +x "$bash_path"
done
