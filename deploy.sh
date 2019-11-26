find $(ls --almost-all --ignore .git) -type d -exec mkdir -p ~/{} \;
find $(ls --almost-all --ignore .git) -type f ! -name .empty ! -name deploy.sh -exec cp {} ~/{} \;
