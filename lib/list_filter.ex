defmodule ListFilter do
  @doc """
  ## Exemple

  iex> ListFilter.call(["1", "2", "3"])
  {:ok, 2}
  """
  def call([]), do: {:error, "the list must contain at least one item"}

  def call(list) do
    result =
      Enum.flat_map(list, &handle_parse(Integer.parse(&1)))
      |> Enum.sum()

    {:ok, result}
  end

  defp handle_parse({int, _}), do: [rem(int, 2)]

  defp handle_parse(_), do: []
end
