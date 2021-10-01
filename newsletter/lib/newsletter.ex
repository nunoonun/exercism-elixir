defmodule Newsletter do
  def read_emails(path), do: split_emails(File.read!(path))

  defp split_emails(""), do: []
  defp split_emails(emails) do
    emails
    |> String.trim_trailing("\n")
    |> String.split("\n")
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    file_pid = open_log(log_path)

    emails_path
    |> read_emails()
    |> Enum.each(fn email ->
      if send_fun.(email) == :ok do
        log_sent_email(file_pid, email)
      end
    end)

    close_log(file_pid)
  end
end
