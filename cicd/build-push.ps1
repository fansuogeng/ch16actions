param(
    [switch]$NoPush=$false
)

try {
    . ./set-vars.ps1
    pushd ../src

    echo "Building images with build number tag: $env:BUILD_NUMBER"
    docker compose $buildComposeFiles build --pull
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    if (-not $NoPush) {
        echo "Pushing images with build number tag: $env:BUILD_NUMBER"
        docker compose $buildComposeFiles push
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }
    }
}
finally {
    popd
}