<br>
<div align="center">
    <h1>🚀 Language benchmarks</h1>
    <strong>Runtime performance benchmarks of different languages</strong>
</div>
<br>
<br>

## 💪 Motivation

This repository aims to compare runtime performance of different languages (C, Go, JavaScript, Rust and Zig) over time through several cases (such as bubble sort algorithm, file IO, loop)...
To be fair enough, the implementations try to be as close/similar as possible between languages.

Contributions are welcomed ✌️.

<br>

## 🚀 Quickstart

To run the benchmark cases **locally**, Docker can be used to simplify the execution flow:

Build the image:

```bash
docker build . --file Dockerfile --tag adbayb/language-benchmarks:latest
```

Run the image:

```bash
docker run adbayb/language-benchmarks:latest
```

_If you don't have Docker, benchmark suite can still be run via `make all` command in the repository root. For this, please make sure to have all [necessary binaries installed locally](Dockerfile)._

<br>

## 🔢 Results

Each benchmark result is saved inside the corresponding case folder. For example, for the bubble sort algorithm:
- The general result outcome is available in the [bubble-sort/README.md](bubble-sort/README.md) file
- All detailed measurements can be checked in the [bubble-sort/RESULTS.json](bubble-sort/RESULTS.json) file