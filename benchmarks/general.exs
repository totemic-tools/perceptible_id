Benchee.run(
  %{
    "generate.8" => fn -> Enum.map(1..10000, fn _ -> PerceptibleId.generate() end) end,
    "generate.9" => fn -> Enum.map(1..10000, fn _ -> PerceptibleId.generate(9) end) end,
    "generate.10" => fn -> Enum.map(1..10000, fn _ -> PerceptibleId.generate(10) end) end,
    "generate.11" => fn -> Enum.map(1..10000, fn _ -> PerceptibleId.generate(11) end) end,
    "generate.12" => fn -> Enum.map(1..10000, fn _ -> PerceptibleId.generate(12) end) end
  }
)
