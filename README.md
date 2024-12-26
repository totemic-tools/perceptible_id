# Perceptible ID

A customizable ID generator which, by default, is limited to the following 22 English characters:

```elixir
[a, b, c, d, e, f, h, i, j, k, m, n, o, p, r, s, t, w, x, y, 3, 4]
```

Inspired by [Understanding and avoiding visually ambiguous characters in IDs](https://gajus.com/blog/avoiding-visually-ambiguous-characters-in-ids#visually-unambiguous-dictionary).

## Installation

The package can be installed by adding `perceptible_id` to your list
of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:perceptible_id, "~> 1.0.0"}
  ]
end
```

## Usage

Generating an ID with the default length and default characters from config:

```elixir
iex> PerceptibleId.generate
"ipbx4ah3"
```

Generating an ID with a custom length:

```elixir
iex> PerceptibleId.generate(12)
"cnhxie3sfdtp"
```

Generating an ID with a custom length, with potential inclusions and
ultimate exclusions:

```elixir
iex> PerceptibleId.generate(12, include: ["1", "2", "3"], exclude: ["a", "b", "c"])
"npokwc3yfed2"
```

## Maximum Possible IDs by Length

This is based on the default number of characters, which is `22`.

| Character Length | Max Unique IDs         |
|------------------|------------------------|
| 1                | 22                     |
| 2                | 484                    |
| 3                | 10,648                 |
| 4                | 234,256                |
| 5                | 5,153,632              |
| 6                | 113,379,904            |
| 7                | 2,494,357,888          |
| 8 (default)      | 54,875,873,536         |
| 9                | 1,207,269,217,792      |
| 10               | 26,559,922,791,424     |
| 11               | 584,318,301,411,328    |
| 12               | 12,855,002,631,049,216 |

## Randomization Algorithm

Internally, this is using Erlang's `:rand` module to generate the
IDs. It is using the default algorithm, [exsss](https://www.erlang.org/doc/apps/stdlib/rand.html#default-algorithm).

## Benchmarks

The following benchmark was run for IDs from length 8 to 12 with each test generating 10k IDs.

```
[1] % mix run benchmarks/general.exs
Operating System: Linux
CPU Information: AMD Ryzen 9 5950X 16-Core Processor
Number of Available Cores: 32
Available memory: 31.26 GB
Elixir 1.17.1
Erlang 27.0
JIT enabled: true

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 35 s

Benchmarking generate.10 ...
Benchmarking generate.11 ...
Benchmarking generate.12 ...
Benchmarking generate.8 ...
Benchmarking generate.9 ...
Calculating statistics...
Formatting results...

Name                  ips        average  deviation         median         99th %
generate.8          28.87       34.64 ms     ±1.88%       34.49 ms       37.21 ms
generate.10         28.22       35.44 ms     ±1.55%       35.29 ms       38.21 ms
generate.11         27.02       37.01 ms     ±5.18%       36.07 ms       41.43 ms
generate.12         26.82       37.29 ms     ±5.31%       36.25 ms       41.67 ms
generate.9          26.52       37.71 ms     ±6.14%       36.48 ms       41.44 ms

Comparison:
generate.8          28.87
generate.10         28.22 - 1.02x slower +0.80 ms
generate.11         27.02 - 1.07x slower +2.36 ms
generate.12         26.82 - 1.08x slower +2.65 ms
generate.9          26.52 - 1.09x slower +3.07 ms
```

You can run this on your machine using `mix run benchmarks/general.exs`.

## License

This software is licensed under the [Apache-2.0 License](LICENSE).
