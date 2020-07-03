echo "Starting build process"
workingDir=$(pwd) 
echo "Working Directory: " $workingDir

cd helm-chart-sources
for d in */ ; do
    fullPath="${workingDir}/helm-chart-sources/${d}"
    echo $fullPath
    cd "$fullPath"
    helm package ./$d
    mv -n *.tgz "$workingDir/helm-chart-packages"
    cd "$workingDir"
done

cd "$workingDir/helm-chart-packages"
helm repo index . --merge index.yaml
