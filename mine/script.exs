pid = spawn fn ->
  receive do
    :hello -> IO.puts("Hello world!")
  end
end

send(pid, :hello)
send(pid, :stop)
