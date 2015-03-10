defmodule Schizo do
  @moduledoc """
  A nice module that lets you uppercase or unvowel every other letter in a sentence.
  """
  def uppercase(string) do
    transform_every_other_word(string, &upper_caser/1)
  end

  def unvowel(string) do
    transform_every_other_word(string, &unvoweler/1)
  end


  defp transform_every_other_word(string, transformation) do
    # Split string on spaces into a list of words
    words = String.split(string)
    words_with_index = Stream.with_index(words)
    transformed_words = Enum.map(words_with_index, transformation)
    Enum.join(transformed_words, " ")
    # Transform every other word (uppercasing)
    # Join the words back with space
  end

  def upper_caser(input) do
    transformer(input, &String.upcase/1)
  end

  def unvoweler(input) do
    transformer(input, fn (word) -> Regex.replace(~r/[aeiou]/, word, "") end)
  end

  def transformer({word, index}, transformation) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformation.(word)
    end
  end
end
