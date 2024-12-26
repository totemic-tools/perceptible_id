defmodule PerceptibleId do
  # API

  @charset MapSet.new(~w(a b c d e f h i j k m n o p r s t w x y 3 4))

  @doc """
  Returns the default character set used to generate the ID.
  """
  @spec charset() :: MapSet.t(String.t)
  def charset, do: @charset

  @doc """
  Generates a perceptible ID. That defaults to:

  * 8 characters in length
  * 22 characters.

  ## Examples

      iex> PerceptibleId.generate()
      "escyphtf"
  """
  @spec generate() :: String.t()
  def generate, do: generate_id(8, [])

  @doc """
  Generates a perceptible ID of `n` length.

  ## Options

  * `:include` - a list of characters to potentially include in the ID
  * `:exclude` - a list of characters to exclude from ID generation

  ## Examples

      iex> PerceptibleId.generate(12)
      "bawepsticymj"

      iex> PerceptibleId.generate(12, include: ["7", "8", "9"])
      "9d7jbowtps3y"

      iex> PerceptibleId.generate(12, include: ["1", "2", "3"], exclude: ["h", "a"])
      "3msdtj1wecri"
  """
  @spec generate(length :: pos_integer(), opts :: Keyword.t()) :: String.t()
  def generate(n, opts \\ []) do
    generate_id(n, opts)
  end

  # Private

  defp generate_id(length, opts) do
    include = Keyword.get(opts, :include, []) |> MapSet.new()
    exclude = Keyword.get(opts, :exclude, []) |> MapSet.new()

    charset()
    |> MapSet.union(include)
    |> MapSet.difference(exclude)
    |> Enum.take_random(length)
    |> :erlang.iolist_to_binary()
  end
end
