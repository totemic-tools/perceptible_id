defmodule PerceptibleIdTest do
  use ExUnit.Case

  @missing_chars_regex ~r/[glquvz12567890]/
  @custom_chars_regex ~r/[gloquvz256789]/

  describe ".generate/0" do
    test "generates an ID with a defaut length of 8" do
      id = PerceptibleId.generate()

      assert is_binary(id)
      assert 8 == String.length(id)
      refute String.match?(id, @missing_chars_regex)
    end
  end

  describe ".generate/2" do
    test "generates an ID with a length of 12" do
      id = PerceptibleId.generate(12)

      assert is_binary(id)
      assert 12 == String.length(id)
      refute String.match?(id, @missing_chars_regex)
    end

    test "generates an ID with inclusions and exclusions with a length of 12" do
      id = PerceptibleId.generate(12, include: ["0", "1"], exclude: ["o"])

      assert is_binary(id)
      assert 12 == String.length(id)
      refute String.match?(id, @custom_chars_regex)
    end
  end
end
