# RandomNames.jl: generating random names in Julia

[![Build Status](https://github.com/xukai92/RandomNames.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/xukai92/RandomNames.jl/actions/workflows/CI.yml?query=branch%3Amain)

Generating random names by combining random adjective and nouns.
Useful for automatically assigning readable, easy-to-refer names to experiments.

## Usage

```julia
using RandomNames

rand(RandomName()) # => "ivory-receipt"
rand(RandomName()) # => "gourmet-paper"
rand(RandomName()) # => "descent-head"
```

## Acknowledgements
- Originally inspired by W&B auto experiment name generation
- Word lists are takend from https://github.com/imsky/wordlists, which is also used by https://github.com/beasteers/randomname
