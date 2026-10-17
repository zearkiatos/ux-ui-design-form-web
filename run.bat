@echo off
REM Console application runner script for Windows
REM This script provides commands to build and run the UX/UI Design Form Web project

setlocal enabledelayedexpansion

if "%1"=="docker-up" (
    docker-compose up
    goto end
)

if "%1"=="docker-down" (
    docker-compose down
    goto end
)

if "%1"=="podman-up" (
    podman-compose up
    goto end
)

if "%1"=="podman-down" (
    podman-compose down
    goto end
)

if "%1"=="" (
    echo Usage: run.bat [command]
    echo.
    echo Commands:
    echo   docker-up   - Start the Docker environment
    echo   docker-down - Stop the Docker environment
    echo   podman-up   - Start the Podman environment
    echo   podman-down - Stop the Podman environment
    goto end
)

echo Unknown command: %1
echo Use 'run.bat' with no arguments to see available commands.

:end
endlocal