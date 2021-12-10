name: Auto-tag

on:
  push:
    branches:
    - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: jaliborc/action-general-autotag@1.0.0
      with:
        GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"
        source_file: ".version"
        extraction_regex: ".*"
