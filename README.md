# rust-parallel

![Rust](https://img.shields.io/badge/rust-1.18.1-orange.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

`rust-parallel` is a fast command line application built using Rust and Tokio. It allows you to run commands in parallel with a similar interface to GNU Parallel or xargs, along with some useful additional features.

## Features

- Efficient handling of parallel command execution.
- Implements a user-friendly command-line interface.
- Built on the Rust/Tokio platform for high performance.

## Installation

You can install `rust-parallel` using Nix with the following commands:

1. Clone the repository:
   ```bash
   git clone https://github.com/sedlund/rust-parallel
   cd rust-parallel
   ```

2. Build the package:
   ```bash
   nix build
   ```

3. Run the program:
   ```bash
   ./result/bin/rust-parallel
   ```

4. Add it to your profile:
    ```
    nix profile install .#

    ```

## Development Shell

To create a development shell with the required dependencies, run:

```bash
nix develop
```

This will set up a shell with:
- Cargo (Rust's package manager)
- Clang (C language family compiler)
- nixfmt-rfc-style (for formatting Nix files)

## Meta Information

- **Homepage**: [rust-parallel GitHub](https://github.com/aaronriekenberg/rust-parallel)
- **License**: MIT
- **Maintainers**: [sedlund](https://github.com/sedlund)

## Supported Platforms

- x86_64-linux
- x86_64-darwin
- aarch64-linux
- aarch64-darwin

## Contributing

Contributions are welcome! Please feel free to open issues or send pull requests if you would like to improve the project.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

