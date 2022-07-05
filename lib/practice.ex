defmodule Practice do
  @moduledoc """
  Documentation for `Practice`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Practice.hello()
      :world

  """
  def hello do
    :world
  end

  # In O(n) time -- sorting will take too long
  def longest_consecutive_sequence(list) do
    # map of numbers +/- 1, track length
      # problem of updating length of consecutive stretch
    # maybe track ranges [max: #, min: #, length: #]
    check_numbers(list, 0, [])
  end

  # # Proceed with longest length.
  # defp change_length(tail, map_, value, length) when value > length,
  #   do: check_numbers(tail, map_, value)
  # defp change_length(tail, map_, value, length),
  #   do: check_numbers(tail, map_, length)

  defp check_numbers([], length, ranges), do: length
  # checking each range could take O(n!) time
  defp check_numbers([head | tail], length, []), do:
    check_numbers(tail, 1, [[max: head, min: head, length: 1]])
  defp check_numbers([head | tail], length, ranges) do
    {ranges_, length_} = update_ranges(head, length, ranges, [])
    if length_ > length do
      check_numbers(tail, length, ranges_)
    else
      check_numbers(tail, length_, ranges_)
    end
  end

  defp update_ranges(value, length, [head | []], checked) do

  end
  defp update_ranges(value, length, [head | tail] = ranges, checked) do
    max = Keyword.get(head, :max)
    min = Keyword.get(head, :min)
    cond do
      value <= max && value >= min -> {ranges <> checked, length}

      # what if two ranges combine
      value == max + 1 ->
        length_ = Keyword.get(head, :length) + 1
        # update range
        head_ = Keyword.put(head, :max, value)
                |> Keyword.put(head, :length, length_)
        longest = if length_ > length, do: length_, else: length
        combine_ranges(length, head_, checked <> tail, [])

      value == min - 1 ->
    end
  end

  defp combine_ranges(length, updated, [], checked), do: {checked, length}
  defp combine_ranges(length, updated, [head | tail], checked) do
    cond do
      updated[:max] + 1 == head[:min] -> # combine ranges

      updated[:min] - 1 == head[:max] ->

    end
  end
  # defp check_numbers([head | tail], map, length, ranges) do
  #   plus = Map.get(map, head + 1)
  #   minus = Map.get(map, head - 1)
  #   consecutive = Map.get(map, head)
  #   cond do
  #     # all three already present
  #     plus && minus && consecutive -> check_numbers(tail, map, length)

  #     # only one consecutive
  #     plus || minus ->
  #       cond do
  #         # add 1 to length value for consecutive stretch
  #         plus  -> map_ = Map.put(map, head, plus + 1)
  #                         # if other value is end of consecutive stretch, ensure same length
  #                         # what if [1, 2], then 0 checked, 2 would not be updated
  #                         |> Map.put(head + 1, plus + 1)
  #                  change_length(tail, map_, plus + 1, length)

  #         minus -> map_ = Map.put(map, head, minus + 1)
  #                  change_length(tail, map_, minus + 1, length)
  #       end

  #     # key not in map
  #     true -> map_ = Map.put(map, head, 1)
  #             change_length(tail, map_, 1, length)
  #   end
  # end
end
