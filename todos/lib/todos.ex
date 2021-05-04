defmodule Todos do
  def create_todos do
    {number_of_tasks, _} =
      IO.gets("Enter the number of tasks you want to add: ") |> Integer.parse()

    for _ <- 1..number_of_tasks do
      IO.gets("Enter Task: ") |> String.trim()
    end
  end

  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

  def complete_task(tasks, task) do
    if contains?(tasks, task) do
      List.delete(tasks, task)
    else
      "task does not exist"
    end
  end

  def random_task(tasks) do
    [task] = Enum.take_random(tasks, 1)
    task
  end

  def save(tasks, filename) do
    binary = :erlang.term_to_binary(tasks)
    File.write(filename, binary)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file does not exist"
    end
  end
end
