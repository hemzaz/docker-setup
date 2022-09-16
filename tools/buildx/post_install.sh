#!/bin/bash

source /var/lib/docker-setup/functions

echo "Make buildx the default builder on login"
cat >"${prefix}/etc/profile.d/docker-buildx-install" <<EOF
#!/bin/bash
cat <<< "\$(jq '. * {"aliases": {"builder": "buildx"}}' "\${HOME}/.docker/config.json")" >"\${HOME}/.docker/config.json"
EOF

if docker version >/dev/null 2>&1; then
    echo "Enable multi-platform builds"
    "${target}/bin/docker" container run --privileged --rm tonistiigi/binfmt --install all
fi