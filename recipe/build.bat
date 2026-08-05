@echo on

set "CARGO_PROFILE_RELEASE_STRIP=symbols"
set "CARGO_PROFILE_RELEASE_LTO=fat"

:: check licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY.yml || exit /b 1

:: build statically linked binary with Rust
cargo install --bins --no-track --locked --root %PREFIX% --path . || exit /b 1