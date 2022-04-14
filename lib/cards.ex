defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """


  def hello do
    "Hi there!!!"
  end

  def ugh do
    "UGHHHHHH"
  end

  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five"
    ]

    suits = [
      "Spades", 
      "Clubs", 
      "Hearts", 
      "Diamonds"
      ]

      for suit <- suits, value <- values do
          "#{value} of #{suit}"
      end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def deal(deck, hand_size) do
      Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist1"
    end
  end

  def create_hand(size) do
   

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(size)
  end

end