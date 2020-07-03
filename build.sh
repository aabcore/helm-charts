echo "Starting build process"
workingDir=$(pwd) 

cd helm-chart-sources
for d in */ ; do
    fullPath="${workingDir}/helm-chart-sources/${d}"
    cd "$fullPath"
    helm package .
    mv -n *.tgz "$workingDir/helm-chart-packages"
    rm *.tgz
    cd "$workingDir"
done

cd "$workingDir/helm-chart-packages"
helm repo index . --merge index.yaml

echo "Finished build process"